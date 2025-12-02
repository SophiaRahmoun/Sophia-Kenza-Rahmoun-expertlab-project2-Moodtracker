//
//  CalendarDay.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import Foundation
import SwiftUI

struct CalendarDay: Identifiable {
    let id = UUID()
    let date: Date
    var mood: MoodType?
    var hasSummary: Bool
}
