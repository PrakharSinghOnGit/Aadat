import SwiftUI

struct MainTimelineView: View {
    var viewModel: HabitViewModel
    @State private var showAddSheet = false
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(viewModel.habits, id: \.id) { habit in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(habit.name)
                                    .font(.headline)
                                Text("Priority: \(habit.priority)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 8)
                    }
                }
                .listStyle(.plain)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: { showAddSheet = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(.blue)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Habits")
        .sheet(isPresented: $showAddSheet) {
            AddHabitSheet(viewModel: viewModel)
        }
    }
}
