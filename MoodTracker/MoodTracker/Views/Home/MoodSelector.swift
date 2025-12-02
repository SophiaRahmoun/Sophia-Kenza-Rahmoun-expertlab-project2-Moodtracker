//
//  MoodSelector.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import SwiftUI

struct MoodSelector: View {
    @Binding var selectedMood: MoodType

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Select your mood:")
                .font(.headline)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(MoodType.allCases, id: \.self) { mood in
                        Button {
                            selectedMood = mood
                        } label: {
                            Text(mood.emoji)
                                .font(.system(size: 40))
                                .padding()
                                .background(selectedMood == mood ? mood.color.opacity(0.3) : Color.clear)
                                .clipShape(Circle())
                        }
                    }
                }
                .padding(.vertical, 8)
            }
        }
    }
}
