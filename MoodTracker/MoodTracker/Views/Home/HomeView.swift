//
//  HomeView.swift
//  MoodTracker
//
//  Created by admin on 02/12/2025.
//
import SwiftUI
struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @StateObject private var weatherVM = WeatherViewModel()
    @StateObject private var quoteVM = QuoteViewModel()
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        GeometryReader { geometry in
            let isLargeScreen = geometry.size.width > 600

            ScrollView {
                VStack(spacing: 20) {
                    
                    WeatherCard(weather: weatherVM.weather)
                    QuoteCard(quote: quoteVM.quote)


                    Text("How are you feeling today?")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)


                    MoodSelector(
                        selectedMood: $viewModel.selectedMood
                    )

                    MoodGrid(
                        selectedMood: $viewModel.selectedMood
                    )

                    DaySummarySection(viewModel: viewModel)
                }
                .padding(.horizontal, isLargeScreen ? 64 : 20)
                .padding(.top, isLargeScreen ? 64 : 20)
                .padding(.bottom, 32)
                .frame(maxWidth: min(geometry.size.width * 0.95, 700))
                .navigationTitle("Today")
                .frame(minHeight: geometry.size.height - 50)
            }
        }
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(image: $viewModel.selectedImage)
        }
        .onChange(of: locationManager.latitude) { _ in
            if let lat = locationManager.latitude,
               let lon = locationManager.longitude {
                weatherVM.fetchWeather(lat: lat, lon: lon)
            }
        }
        .onAppear {
            quoteVM.fetchQuote()
        }
    }
}

#Preview {
    HomeView()
}
