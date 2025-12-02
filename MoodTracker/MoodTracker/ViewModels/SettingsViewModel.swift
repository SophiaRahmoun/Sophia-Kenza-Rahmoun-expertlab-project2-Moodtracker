//
//  SettingsViewModel.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import SwiftUI
import CoreLocation
import UserNotifications
import PhotosUI

class SettingsViewModel: ObservableObject {

    @AppStorage("appColorScheme") var appColorScheme: String = "system"

    @Published var locationStatus: CLAuthorizationStatus = .notDetermined
    @Published var notificationEnabled: Bool = false
    @Published var photoAccess: PHAuthorizationStatus = .notDetermined
    @Published var watchConnected: Bool = false

    private let locationManager = CLLocationManager()

    init() {
        checkLocationStatus()
        checkNotificationStatus()
        checkPhotoStatus()
    }

    func setColorScheme(_ mode: String) {
        appColorScheme = mode
    }

    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
        checkLocationStatus()
    }

    func checkLocationStatus() {
        locationStatus = locationManager.authorizationStatus
    }

    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            DispatchQueue.main.async {
                self.notificationEnabled = granted
            }
        }
    }

    func checkNotificationStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.notificationEnabled = settings.authorizationStatus == .authorized
            }
        }
    }

    func requestPhotoAccess() {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                self.photoAccess = status
            }
        }
    }

    func checkPhotoStatus() {
        photoAccess = PHPhotoLibrary.authorizationStatus()
    }

    func toggleWatchConnection() {
        watchConnected.toggle()
        // watch connectivity here later
    }
}
