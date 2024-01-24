//
//  HourlyForecastViewModel.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import Foundation
import Combine

final class HourlyForecastViewModel: ObservableObject {
    let weatherService: WeatherService
    @Published var hoursWeather: [HourlyForecast] = []
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
        
    }
    
    func loadForecast() {
        Task {
            await getTwelveHourForecast()
        }
    }
    
    func getTwelveHourForecast() async {
        do {
            let currentDate = getCurrentDateString()
            if let hours = try await weatherService.fetchWeatherForecast(forCity: "Chisinau", date: currentDate) {
                await updateHoursWeather(with: hours)
            }
        } catch {
            print("Error fetching forecast: \(error)")
            // Handle the error appropriately
        }
    }
    
    func getCurrentHourIndex() -> Int? {
        let currentHour = getCurrentHourString()
        return hoursWeather.firstIndex(where: { $0.time.extractHourAndMinute() == currentHour })
    }
    
    private func getCurrentDateString() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"  // Adjust the format to match your API requirements
        return dateFormatter.string(from: now)
    }
    
    
    private func updateHoursWeather(with hours: [HourlyForecast]) async {
        await MainActor.run {
            self.hoursWeather = hours
        }
    }
    
    private func getCurrentHourString() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:00"
        return dateFormatter.string(from: now)
    }
}
