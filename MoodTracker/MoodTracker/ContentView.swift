//
//  ContentView.swift
//  MoodTracker
//
//  Created by admin on 25/11/2025.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @AppStorage("appColorScheme") var appColorScheme: String = "system"
    var body: some View {
        TabView {
            HomeView()
                .preferredColorScheme(ColorSchemeManager.resolve(appColorScheme))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            CalendarView()
                .preferredColorScheme(ColorSchemeManager.resolve(appColorScheme))
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }

            SettingsView()
                .preferredColorScheme(ColorSchemeManager.resolve(appColorScheme))
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    ContentView()
}
