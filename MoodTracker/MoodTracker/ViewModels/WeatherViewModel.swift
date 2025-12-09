//
//  WeatherViewModel.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//

import Foundation
import CoreLocation

class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var weather: WeatherModel?
    private let locationManager = CLLocationManager()
    private let apiKey = "c10b46bf180949619de233934250112"
    
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            fetchWeather(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
    }
    
    func fetchWeather(lat: Double, lon: Double) {
        let latStr = String(format: "%.4f", lat)
        let lonStr = String(format: "%.4f", lon)
        
        print("Fetch weather for: \(latStr), \(lonStr)")

        
        guard let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(latStr),\(lonStr)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.weather = WeatherModel.from(response: result)
                    }
                } catch {
                    print("Error decoding weather: \(error)")
                }
            }
        }.resume()
    }
    
}
extension WeatherModel {
    static func from(response: WeatherResponse) -> WeatherModel {
        let temperature = Int(response.current.temp_c)
        let condition = response.current.condition.text
        let icon = mapConditionToIcon(condition)

        return WeatherModel(temperature: temperature, icon: icon, description: condition)
    }

    private static func mapConditionToIcon(_ condition: String) -> String {
        let lowercased = condition.lowercased()

        if lowercased.contains("sunny") {
            return "sun.max.fill"
        } else if lowercased.contains("cloud") {
            return "cloud.fill"
        } else if lowercased.contains("rain") {
            return "cloud.rain.fill"
        } else if lowercased.contains("snow") {
            return "snow"
        } else if lowercased.contains("storm") {
            return "cloud.bolt.rain.fill"
        } else {
            return "cloud.sun.fill" 
        }
    }
}

struct WeatherModel {
    let temperature: Int
    let icon: String
    let description: String
}

struct WeatherResponse: Codable {
    let current: WeatherCurrent
}

struct WeatherCurrent: Codable {
    let temp_c: Double
    let condition: WeatherCondition
}

struct WeatherCondition: Codable {
    let text: String
}
