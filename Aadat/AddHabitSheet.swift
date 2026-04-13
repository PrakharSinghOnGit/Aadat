import SwiftUI

struct AddHabitSheet: View {
    @Environment(\.dismiss) var dismiss
    var viewModel: HabitViewModel
    
    @State private var habitName: String = ""
    @State private var habitPriority: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Habit Name", text: $habitName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                TextField("Priority (number)", text: $habitPriority)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .padding()
                
                Button("Save") {
                    saveHabit()
                }
                .disabled(habitName.isEmpty || habitPriority.isEmpty)
                .buttonStyle(.borderedProminent)
                .padding()
                
                Spacer()
            }
            .navigationTitle("Add Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func saveHabit() {
        if let priority = Int(habitPriority) {
            viewModel.addHabit(name: habitName, priority: priority)
            dismiss()
        }
    }
}
