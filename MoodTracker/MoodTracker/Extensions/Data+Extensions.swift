//
//  Data+Extensions.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
