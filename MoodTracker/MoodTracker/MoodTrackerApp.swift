//
//  MoodTrackerApp.swift
//  MoodTracker
//
//  Created by admin on 25/11/2025.
//

import SwiftUI
import UserNotifications

@main
struct MoodTrackerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

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

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application (_ application: UIApplication,
                      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
}
