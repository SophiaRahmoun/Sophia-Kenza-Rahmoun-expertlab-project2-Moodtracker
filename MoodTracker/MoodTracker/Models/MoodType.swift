//
//  MoodType.swift
//  MoodTracker
//
//  Created by admin on 01/12/2025.
//


import SwiftUI

enum MoodType: String, CaseIterable, Codable, Identifiable {
    case happy, sad, neutral, angry, excited
    var id: String {rawValue}

       var emoji: String {
           switch self {
           case .happy:    "😊"
           case .sad:      "😢"
           case .neutral:  "😐"
           case .angry:    "😡"
           case .excited:  "🤩"
           }
       }

       var label: String {
           rawValue.capitalized
       }

       var color: Color {
           switch self {
           case .happy:    .yellow
           case .sad:      .blue
           case .neutral:  .gray
           case .angry:    .red
           case .excited:  .green
           }
       }
   }
