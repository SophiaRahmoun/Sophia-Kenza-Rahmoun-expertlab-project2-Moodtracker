//
//  DaySummarySection.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import SwiftUI
struct DaySummarySection: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Write a summary about your day")
                    .font(.headline)
                
                TextEditor(text: $viewModel.daySummary)
                    .frame(height: 150)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
            }
            
            Button(action: {
                viewModel.selectPhoto()
            }) {
                Image(systemName: "photo")
                    .font(.title2)
                    .padding(10)
                    .background(Color(.systemGray5).opacity(0.8))
                    .foregroundColor(Color(.systemGray))
                    .clipShape(Circle())
                    .shadow(radius: 2)
            }
            .padding(.trailing, 16)
            .padding(.bottom, 16)
        }
            Button {
                Task {
                   await viewModel.saveSummary()

                }
            } label: {
                Text("Save my summary")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .cornerRadius(45)
                    .padding(.top, 5)
            }
        
    }
}
#Preview {
    HomeView()
}
