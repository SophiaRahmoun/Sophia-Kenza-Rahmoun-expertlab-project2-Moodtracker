//
//  HomeViewModel.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//


import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published var selectedMood: MoodType = .happy
    @Published var daySummary: String = ""
    @Published var selectedImage: UIImage? = nil
    @Published var showImagePicker: Bool = false
    
    @AppStorage("userId") var userId: String = UUID().uuidString
    @Published var isSaving = false
    @Published var saveSuccess: Bool = false

    func selectPhoto() {
        showImagePicker = true
    }
    
    func saveSummary() async{
        let trimmed = daySummary.trimmingCharacters(in: .whitespacesAndNewlines)

             guard !trimmed.isEmpty else {
                 print(" !! Summary empty = not saving.")
                 saveSuccess = false
                 return
             }

            
        isSaving = true

        let todayString = formattedToday()

        do {
            try await CalendarService.shared.saveDay(
                userId: userId,
                date: todayString,
                mood: selectedMood.rawValue,
                summary: trimmed,
                image: selectedImage
            )
            
            print("Saved to backend:")
            print("- userId: \(userId)")
            print("- date: \(todayString)")
            print("- mood: \(selectedMood.rawValue)")
            print("- summary: \(trimmed)")
            print("- image: \(selectedImage != nil ? "yes" : "no")")

            saveSuccess = true
        } catch {
            print("Error saving to backend:", error)
            saveSuccess = false
        }

        isSaving = false
    }
    
    private func formattedToday() -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df.string(from: Date())
    }
}
