import SwiftUI

struct TimelineView: View {
    @Environment(\.colorScheme) var colorScheme
    private let dayHeight = AppContents.Timeline.dayHeight
    private let centerX = AppContents.Timeline.centerX
    private let lineWidth = AppContents.Timeline.lineWidth
    private let nodeOffsetX = AppContents.Timeline.nodeOffsetX
    private let nodeHalfHeight = AppContents.Timeline.nodeHalfHeight
    private let days = AppContents.Timeline.weekDays
    private let events = AppContents.Timeline.events

    var body: some View {
        GeometryReader { proxy in
            let topHeight = proxy.size.height * 0.14
            let bottomHeight = proxy.size.height - topHeight

            VStack(spacing: 0) {
                timelineCalendar
                    .frame(height: topHeight)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 6)

                ScrollView(.vertical) {
                    ZStack(alignment: .topLeading) {
                        Path { path in
                            let sortedY = events
                                .map { yPosition(forMinutes: $0.totalMinutes) }
                                .sorted()

                            path.move(to: CGPoint(x: centerX, y: 0))

                            var currentY: CGFloat = 0
                            for y in sortedY {
                                let nodeStart = max(currentY, y - nodeHalfHeight)
                                let nodePeak = y
                                let nodeEnd = y + nodeHalfHeight

                                // Continue straight until this node section.
                                path.addLine(to: CGPoint(x: centerX, y: nodeStart))

                                // Deviation out and back in to represent a logged habit node.
                                path.addQuadCurve(
                                    to: CGPoint(x: centerX + nodeOffsetX, y: nodePeak),
                                    control: CGPoint(x: centerX + nodeOffsetX, y: nodeStart)
                                )
                                path.addQuadCurve(
                                    to: CGPoint(x: centerX, y: nodeEnd),
                                    control: CGPoint(x: centerX + nodeOffsetX, y: nodeEnd)
                                )

                                currentY = nodeEnd
                            }

                            path.addLine(to: CGPoint(x: centerX, y: dayHeight))
                        }
                        .stroke(colorScheme == .dark ? Color.white : Color.black, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))

                        ForEach(events) { event in
                            let y = yPosition(forMinutes: event.totalMinutes)
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                                .background(Circle().fill(Color.white))
                                .frame(width: 14, height: 14)
                                .position(x: centerX + nodeOffsetX, y: y)

                            VStack(alignment: .leading, spacing: 2) {
                                Text(event.timeLabel)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Text(event.title)
                                    .font(.footnote)
                            }
                            .position(x: centerX + 90, y: y)
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: dayHeight, maxHeight: dayHeight, alignment: .topLeading)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                }
                .frame(height: bottomHeight)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background(Color(.systemBackground))
    }

    private var timelineCalendar: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Today")
                .font(.headline)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 7), spacing: 8) {
                ForEach(Array(days.enumerated()), id: \.offset) { index, day in
                    VStack(spacing: 4) {
                        Text(day)
                            .font(.caption2)
                            .foregroundStyle(.secondary)

                        RoundedRectangle(cornerRadius: 6)
                            .stroke(index == AppContents.Timeline.selectedCalendarIndex ? Color.black : Color.gray.opacity(0.5), lineWidth: 1)
                            .frame(height: 22)
                            .overlay {
                                Text("\(index + AppContents.Timeline.calendarStartDay)")
                                    .font(.caption)
                            }
                    }
                }
            }
        }
    }

    private func yPosition(forMinutes minutes: Int) -> CGFloat {
        let clampedMinutes = max(0, min(1440, minutes))
        return (CGFloat(clampedMinutes) / 1440.0) * dayHeight
    }
}

#Preview {
    TimelineView()
}
