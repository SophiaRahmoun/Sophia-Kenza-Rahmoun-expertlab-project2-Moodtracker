//
//  DateFormatter+Extensions.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import Foundation

extension DateFormatter {
    static let monthFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM"
        return df
    }()
}
