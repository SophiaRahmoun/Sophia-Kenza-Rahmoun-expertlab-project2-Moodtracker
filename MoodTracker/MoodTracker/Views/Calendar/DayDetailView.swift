//
//  DayDetailView.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import SwiftUI


struct DayDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let day: CalendarDay

    var body: some View {
        VStack(spacing: 18) {

            RoundedRectangle(cornerRadius: 2.5)
                .fill(Color.gray.opacity(0.4))
                .frame(width: 40, height: 4)
                .padding(.top, 10)

            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                Spacer()
            }
            .padding(.horizontal)

            VStack(spacing: 12) {
                Text("How you felt this day")
                    .font(.title2)
                    .bold()

                if let mood = day.mood {
                    Text(mood.emoji)
                        .font(.system(size: 60))

                    Text(mood.label)
                        .font(.headline)
                        .foregroundColor(.secondary)
                } else {
                    Text("No mood selected yet")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.top, 10)

            Divider().padding(.vertical, 8)

            if day.hasSummary {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your Summary")
                        .font(.headline)
                    
                    Text(fetchSummary(for: day.date))
                        .font(.body)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }

            if let image = fetchImage(for: day.date) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your Photo")
                        .font(.headline)

                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }

            Spacer()
        }
        .padding(.bottom, 20)
    }

    func fetchSummary(for date: Date) -> String {
        // todo:  backend -> récupérer summary pour date
        return "This is a placeholder summary for this day."
    }

    func fetchImage(for date: Date) -> UIImage? {
        // plus tard will return image fetched (backend)
        return nil
    }
}
