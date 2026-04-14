import SwiftUI

struct AnalyticsStatsView: View {
    private let completionPercent = AppContents.Analytics.completionPercent
    private let streaks = AppContents.Analytics.streaks

    var body: some View {
        NavigationStack {
            List {
                Section("Daily Completion") {
                    HStack {
                        Text("Today")
                        Spacer()
                        Text("\(completionPercent)%")
                            .fontWeight(.semibold)
                    }

                    ProgressView(value: Double(completionPercent), total: 100)
                }

                Section("Habit Streaks") {
                    ForEach(streaks, id: \.name) { streak in
                        HStack {
                            Text(streak.name)
                            Spacer()
                            Text("\(streak.days) days")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Analytics & Stats")
        }
    }
}

#Preview {
    AnalyticsStatsView()
}
