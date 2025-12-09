//
//  JSONDecoder.swift
//  MoodTracker
//
//  Created by admin on 09/12/2025.
//

import Foundation

extension JSONDecoder {
    static var calendarDecoder: JSONDecoder {
        let decoder = JSONDecoder()

        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            let df1 = DateFormatter()
            df1.dateFormat = "yyyy-MM-dd"
            if let date = df1.date(from: dateString) { return date }

            //format ISO for mongoDB "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let df2 = ISO8601DateFormatter()
            if let date = df2.date(from: dateString) { return date }

            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid date format: \(dateString)"
            )
        }

        return decoder
    }
}
