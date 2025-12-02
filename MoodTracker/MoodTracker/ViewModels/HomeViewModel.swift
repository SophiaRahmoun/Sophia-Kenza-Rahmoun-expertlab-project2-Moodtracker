//
//  HomeViewModel.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//


import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var selectedMood: MoodType = .happy
    @Published var daySummary: String = ""
    @Published var selectedImage: UIImage? = nil
    @Published var showImagePicker: Bool = false
    
    @Published var saveSuccess: Bool = false

    func selectPhoto() {
        showImagePicker = true
    }
    
    func saveSummary(){
        let trimmed = daySummary.trimmingCharacters(in: .whitespacesAndNewlines)

             guard !trimmed.isEmpty else {
                 print("⚠️ Summary is empty — not saving.")
                 saveSuccess = false
                 return
             }

             print("Saved summary:")
             print("Mood: \(selectedMood)")
             print("Summary: \(trimmed)")
             print("Image attached: \(selectedImage != nil ? "Yes" : "No")")

             saveSuccess = true
    }
    
}
