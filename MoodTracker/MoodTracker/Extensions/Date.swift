//
//  Date.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import Foundation

extension Date {
    var dayString: String {
        let d = Calendar.current.component(.day, from: self)
        return String(d)
    }
}
