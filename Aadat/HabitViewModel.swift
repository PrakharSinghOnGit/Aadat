import Foundation
import Observation

@Observable
final class HabitViewModel {
    var habits: [Habit] = []
    
    init() {
        // Initialize with empty array; in the future, fetch from SwiftData
    }
    
    func addHabit(name: String, priority: Int) {
        let newHabit = Habit(name: name, priority: priority)
        habits.append(newHabit)
        sortHabits()
    }
    
    private func sortHabits() {
        habits.sort { $0.priority < $1.priority }
    }
}
