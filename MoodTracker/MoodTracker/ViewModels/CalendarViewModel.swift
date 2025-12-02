//
//  CalendarViewModel.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import SwiftUI
import Foundation

class CalendarViewModel: ObservableObject {
    @Published var days: [CalendarDay] = []
    @Published var selectedDay: CalendarDay?
    
    private let calendar = Calendar.current

    init() {
        generateCurrentMonth()
    }

    func generateCurrentMonth() {
        days.removeAll()

        let today = Date()
        let range = calendar.range(of: .day, in: .month, for: today)!
        let components = calendar.dateComponents([.year, .month], from: today)

        for day in range {
            var dayComp = components
            dayComp.day = day

            let date = calendar.date(from: dayComp)!

            days.append(
                CalendarDay(
                    date: date,
                    mood: nil,
                    hasSummary: false
                )
            )
        }
    }

    func saveMood(for date: Date, mood: MoodType) {
        if let index = days.firstIndex(where: { calendar.isDate($0.date, inSameDayAs: date) }) {
            days[index].mood = mood
        }
    }

    func saveSummary(for date: Date) {
        if let index = days.firstIndex(where: { calendar.isDate($0.date, inSameDayAs: date) }) {
            days[index].hasSummary = true
        }
    }
}
