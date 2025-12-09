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
    @AppStorage("userId") var userId: String = UUID().uuidString
    
    
    init() {
        generateCurrentMonth()
        
        NotificationCenter.default.addObserver(
               forName: .didSaveDay,
               object: nil,
               queue: .main
           ) { [weak self] _ in
               Task {
                   await self?.loadMonth()
               }
           }
    }
    
    func loadMonth() async {
        let monthString = DateFormatter.monthFormatter.string(from: Date())
        
        do {
            let entries = try await CalendarService.shared.fetchMonth(
                userId: userId,
                month: monthString
            )
            print("loaded entries for month: \(monthString): \(entries.count)")
            updateDays(entries: entries)
        } catch {
            print("Error fetchMonth:", error)
        }
    }
    
    
    private func updateDays(entries: [CalendarDay]) {
        for i in 0..<days.count {
            if let entry = entries.first(where: { sameDay($0.date, days[i].date) }) {
                days[i].mood = entry.mood
                days[i].hasSummary = entry.summary != nil
                days[i].summary = entry.summary
                days[i].photoUrl = entry.photoUrl
            }
        }
    }
    
    func sameDay(_ d1: Date, _ d2: Date) -> Bool {
        calendar.isDate(d1, inSameDayAs: d2)
    }
    func generateCurrentMonth() {
        days.removeAll()

        let today = Date()
        let calendar = Calendar.current

        let range = calendar.range(of: .day, in: .month, for: today)!
        let components = calendar.dateComponents([.year, .month], from: today)

        for day in range {
            var comp = components
            comp.day = day

            if let date = calendar.date(from: comp) {
                days.append(CalendarDay(id: nil, date: date, mood: nil, hasSummary: false, photoUrl: nil, summary: nil))
            }
        }
    }

}
