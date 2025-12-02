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
            HStack(){
                Image(systemName: weather.icon)
                    .font(.system(size: 52))
                    .foregroundColor(.yellow)
                
                VStack(alignment: .leading) {
                    
                    Text("\(weather.temperature)°")
                        .font(.system(size: 32))
                        .bold()
                    
                    Text(weather.description.capitalized)
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }

            .cornerRadius(15)
        }
    }
}
#Preview {
    HomeView()
}
