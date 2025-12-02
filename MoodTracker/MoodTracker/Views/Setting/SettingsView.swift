//
//  SettingsView.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import SwiftUI


struct SettingsView: View {
    @StateObject private var vm = SettingsViewModel()

    
    var body: some View {
        
             ScrollView {
                 VStack(alignment: .leading, spacing: 24) {

                     SettingsCard(title: "Appearance") {
                         VStack(alignment: .leading, spacing: 12) {
                             themeButton("System", value: "system")
                             themeButton("Light Mode", value: "light")
                             themeButton("Dark Mode", value: "dark")
                         }
                     }

                     SettingsCard(title: "Permissions") {
                         VStack(alignment: .leading, spacing: 18) {

                             permissionRow(
                                 title: "Location Access",
                                 status: vm.locationStatus == .authorizedWhenInUse ? "Allowed" : "Not allowed",
                                 action: vm.requestLocationPermission
                             )

                             permissionRow(
                                 title: "Notifications",
                                 status: vm.notificationEnabled ? "On" : "Off",
                                 action: vm.requestNotificationPermission
                             )

                             permissionRow(
                                 title: "Photos Access",
                                 status: vm.photoAccess == .authorized ? "Allowed" : "Not allowed",
                                 action: vm.requestPhotoAccess
                             )
                         }
                     }

                     SettingsCard(title: "Devices") {
                         HStack {
                             Text("Connect Apple Watch")
                             Spacer()
                             Toggle("", isOn: $vm.watchConnected)
                                 .labelsHidden()
                         }
                     }
                 }
                 .padding(.horizontal, 20)
                 .padding(.vertical, 24)
             }
             .navigationTitle("Settings")
         }

         
         func themeButton(_ label: String, value: String) -> some View {
             Button {
                 vm.setColorScheme(value)
             } label: {
                 HStack {
                     Text(label)
                     Spacer()
                     if vm.appColorScheme == value {
                         Image(systemName: "checkmark.circle.fill")
                             .foregroundColor(.yellow)
                     }
                 }
                 .padding()
                 .background(Color.gray.opacity(0.08))
                 .cornerRadius(12)
             }
         }

         func permissionRow(title: String, status: String, action: @escaping () -> Void) -> some View {
             HStack {
                 VStack(alignment: .leading) {
                     Text(title)
                         .font(.headline)
                     Text(status)
                         .font(.subheadline)
                         .foregroundColor(.secondary)
                 }
                 Spacer()
                 Button("Allow") {
                     action()
                 }
                 .padding(.horizontal, 14)
                 .padding(.vertical, 6)
                 .background(Color.yellow)
                 .cornerRadius(8)
             }
         }
     }

     struct SettingsCard<Content: View>: View {
         let title: String
         let content: () -> Content

         var body: some View {
             VStack(alignment: .leading, spacing: 16) {
                 Text(title)
                     .font(.title3)
                     .bold()

                 content()
             }
             .padding()
             .background(Color.gray.opacity(0.1))
             .cornerRadius(18)
         }
     }

    


#Preview {
    SettingsView()
}

   
