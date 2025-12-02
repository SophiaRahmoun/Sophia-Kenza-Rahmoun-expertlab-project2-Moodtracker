//
//  CalendarView.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//
import SwiftUI

struct CalendarView: View {
    @StateObject private var vm = CalendarViewModel()
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        VStack(alignment: .leading) {

            Text("Your Month")
                .font(.largeTitle)
                .bold()
                .padding(.leading)

            LazyVGrid(columns: columns, spacing: 18) {
                ForEach(vm.days.indices, id: \.self) { index in
                    let day = vm.days[index]

                    Button {
                        vm.selectedDay = day
                    } label: {
                        VStack(spacing: 4) {

                            let bg = day.mood?.color.opacity(0.6)
                                ?? Color.gray.opacity(0.15)

                            Text(day.date.dayString)
                                .font(.headline)
                                .frame(width: 32, height: 32)
                                .background(bg)
                                .clipShape(Circle())
                                .foregroundColor(.primary)

                            if day.hasSummary {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 6, height: 6)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .sheet(item: $vm.selectedDay) { day in
            DayDetailView(day: day)
        }
    }
}

#Preview {
    CalendarView()
}
