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

            if let summary = day.summary, !summary.isEmpty {
                Text(summary)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }

            if let urlString = day.photoUrl,
               let url = URL(string: "http://localhost:4000\(urlString)") {

                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                    case .failure(_):
                        Text("Could not load image")
                    @unknown default:
                        EmptyView()
                    }
                }
            }

            Spacer()
        }
        .padding(.bottom, 20)
    }

}
