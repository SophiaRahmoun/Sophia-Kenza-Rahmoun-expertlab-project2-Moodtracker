//
//  WeatherCard.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import SwiftUI

struct WeatherCard: View {
    let weather: WeatherModel?
    
    var body: some View {
        if let weather = weather {
            HStack(spacing: 12){
                Image(systemName: weather.icon)
                    .font(.title)
                
                Text("\(weather.temperature)° •  \(weather.description)")
                    .font(.headline)
                
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(15)
        }
    }
}
