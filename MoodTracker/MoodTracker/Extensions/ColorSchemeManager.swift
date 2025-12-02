//
//  ColorSchemeManager.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//


import SwiftUI

class ColorSchemeManager {
    static func resolve(_ appSetting: String) -> ColorScheme? {
        switch appSetting {
        case "light": return .light
        case "dark": return .dark
        default: return nil
        }
    }
}