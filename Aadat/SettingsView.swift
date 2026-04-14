import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = AppContents.Settings.defaultNotificationsEnabled
    @State private var dailyReminderTime = Date.now

    var body: some View {
        NavigationStack {
            Form {
                Section("Preferences") {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    DatePicker("Daily Reminder", selection: $dailyReminderTime, displayedComponents: .hourAndMinute)
                }

                Section("Account") {
                    LabeledContent("Username", value: AppContents.Settings.defaultUserName)
                    LabeledContent("Plan", value: AppContents.Settings.defaultPlan)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
