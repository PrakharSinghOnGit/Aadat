import Foundation
import SwiftUI

struct TimelineEvent: Identifiable {
    let id = UUID()
    let hour: Int
    let minute: Int
    let title: String

    var totalMinutes: Int {
        (hour * 60) + minute
    }

    var timeLabel: String {
        String(format: "%02d:%02d", hour, minute)
    }
}

struct HabitStreak: Identifiable {
    let id = UUID()
    let name: String
    let days: Int
}

struct AppContents {
    struct Timeline {
        static let dayHeight: CGFloat = 2400
        static let centerX: CGFloat = 120
        static let lineWidth: CGFloat = 3
        static let nodeOffsetX: CGFloat = 26
        static let nodeHalfHeight: CGFloat = 16

        static let weekDays = ["M", "T", "W", "T", "F", "S", "S"]
        static let calendarStartDay = 14
        static let selectedCalendarIndex = 1

        static let events: [TimelineEvent] = [
            TimelineEvent(hour: 6, minute: 30, title: "Wake Up"),
            TimelineEvent(hour: 8, minute: 0, title: "Hydration"),
            TimelineEvent(hour: 12, minute: 15, title: "Walk"),
            TimelineEvent(hour: 18, minute: 45, title: "Workout"),
            TimelineEvent(hour: 22, minute: 0, title: "Read")
        ]
    }

    struct Analytics {
        static let completionPercent = 76
        static let streaks: [HabitStreak] = [
            HabitStreak(name: "Hydration", days: 9),
            HabitStreak(name: "Workout", days: 4),
            HabitStreak(name: "Reading", days: 12)
        ]
    }

    struct Leaderboard {
        static let eloScore = 1285
        static let allLineStyles = ["Default", "Rope", "Snake", "Tron"]
        static let unlockThresholds: [String: Int] = [
            "Default": 0,
            "Rope": 1100,
            "Snake": 1250,
            "Tron": 1400
        ]
    }

    struct Settings {
        static let defaultNotificationsEnabled = true
        static let defaultUserName = "AadatUser"
        static let defaultPlan = "Free"
    }
}