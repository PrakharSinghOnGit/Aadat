import Foundation
import SwiftData

@Model
final class Habit {
    var name: String
    var priority: Int
    var id: UUID
    
    init(name: String, priority: Int) {
        self.name = name
        self.priority = priority
        self.id = UUID()
    }
}
