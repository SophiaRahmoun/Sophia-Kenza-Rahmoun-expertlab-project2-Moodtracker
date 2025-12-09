//
//  CalendarAPI.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import Foundation
import SwiftUI

class CalendarService {

    static let shared = CalendarService()
    private init() {}

    private let baseURL = "http://10.2.88.131:4000/api/calendar"

    func fetchMonth(userId: String, month: String) async throws -> [CalendarDay] {
        guard let url = URL(string: "\(baseURL)/month?userId=\(userId)&month=\(month)") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let entries = try JSONDecoder.calendarDecoder.decode([CalendarDay].self, from: data)
        return entries
    }

    func fetchDay(userId: String, date: String) async throws -> CalendarDay? {
        guard let url = URL(string: "\(baseURL)/day?userId=\(userId)&date=\(date)") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let entry = try JSONDecoder.calendarDecoder.decode(CalendarDay?.self, from: data)
        return entry
    }

    func saveDay(
        userId: String,
        date: String,
        mood: String,
        summary: String,
        image: UIImage?
    ) async throws {

        guard let url = URL(string: "\(baseURL)/save") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        let body = try await createMultipartBody(
            userId: userId,
            date: date,
            mood: mood,
            summary: summary,
            image: image,
            boundary: boundary
        )

        request.httpBody = body

        let _ = try await URLSession.shared.data(for: request)
    }

    func createMultipartBody(
        userId: String,
        date: String,
        mood: String,
        summary: String,
        image: UIImage?,
        boundary: String
    ) async throws -> Data {

        var body = Data()

        func addField(key: String, value: String) {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.append("\(value)\r\n")
        }

        addField(key: "userId", value: userId)
        addField(key: "date", value: date)
        addField(key: "mood", value: mood)
        addField(key: "summary", value: summary)

        if let image = image, let imageData = image.jpegData(compressionQuality: 0.7) {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"photo\"; filename=\"photo.jpg\"\r\n")
            body.append("Content-Type: image/jpeg\r\n\r\n")
            body.append(imageData)
            body.append("\r\n")
        }

        body.append("--\(boundary)--\r\n")
        return body
    }
}
