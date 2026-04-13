//
//  AadatApp.swift
//  Aadat
//
//  Created by Shaan SIngh on 12/04/26.
//

import SwiftUI

@main
struct AadatApp: App {
    @State private var viewModel = HabitViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainTimelineView(viewModel: viewModel)
            }
        }
    }
}
