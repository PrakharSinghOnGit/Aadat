//
//  AadatApp.swift
//  Aadat
//
//  Created by Shaan Singh on 12/04/26.
//

import SwiftUI

@main
struct AadatApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Timeline", systemImage: "timeline.selection") {
                    TimelineView()
                }

                Tab("Analytics", systemImage: "chart.bar.xaxis") {
                    AnalyticsStatsView()
                }

                Tab("Leaderboard", systemImage: "trophy") {
                    LeaderboardSocialView()
                }

                Tab("Settings", systemImage: "gearshape") {
                    SettingsView()
                }
            }
        }
    }
}
