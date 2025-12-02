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
    

    func selectPhoto() {
        showImagePicker = true
    }
}
