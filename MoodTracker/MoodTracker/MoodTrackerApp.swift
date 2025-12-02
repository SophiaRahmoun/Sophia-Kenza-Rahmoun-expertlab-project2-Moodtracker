//
//  MoodTrackerApp.swift
//  MoodTracker
//
//  Created by admin on 25/11/2025.
//

import SwiftUI

@main
struct MoodTrackerApp: App {
    @AppStorage("appColorScheme") var appColorScheme: String = "system"
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(ColorSchemeManager.resolve(appColorScheme))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
