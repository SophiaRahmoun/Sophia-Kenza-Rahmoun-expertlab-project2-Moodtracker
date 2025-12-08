//
//  CalendarDay.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import Foundation
import SwiftUI

struct CalendarDay: Identifiable, Codable {
    let id: String?
    let date: Date
    var mood: MoodType?
    var hasSummary: Bool?
    var photoUrl: String?
    var summary: String?
    
    
    init(
           id: String? = nil,
           date: Date,
           mood: MoodType? = nil,
           hasSummary: Bool? = nil,
           photoUrl: String? = nil,
           summary: String? = nil
       ) {
           self.id = id
           self.date = date
           self.mood = mood
           self.hasSummary = hasSummary
           self.photoUrl = photoUrl
           self.summary = summary
       }
}
