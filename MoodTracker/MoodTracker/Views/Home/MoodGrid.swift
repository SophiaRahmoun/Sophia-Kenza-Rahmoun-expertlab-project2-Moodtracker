//
//  MoodGrid.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import SwiftUI

struct MoodGrid: View {
    @Binding var selectedMood: MoodType

    let columns = [GridItem(.adaptive(minimum: 100), spacing: 12)]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(MoodType.allCases, id: \.self) { mood in
                Button {
                    selectedMood = mood
                } label: {
                    Text(mood.label)
                        .font(.subheadline)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(selectedMood == mood ? mood.color : .clear)
                        .foregroundColor(selectedMood == mood ? .white : .primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                        .cornerRadius(10)
                }
            }
        }
    }
}
#Preview {
    HomeView()
}
