//
//  HourlyForecastViewModel.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import Foundation
import Combine

protocol HourlyForecastViewModelProtocol {
    var hoursWeather: [HourlyForecast] { get }
    func getTwelveHourForecast() async
    func getCurrentHourIndex() -> Int?
}


@Observable
final class HourlyForecastViewModel: HourlyForecastViewModelProtocol {
    
    private let weatherService: WeatherService
    var hoursWeather: [HourlyForecast] = []
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
        
    }
    
    func getTwelveHourForecast() async {
        do {
            let currentDate = DateFormatterService.shared.format(date: Date(), with: .dateOnly)
            if let hours = try await weatherService.fetchWeatherForecast(forCity: "Chisinau", date: currentDate) {
                await updateHoursWeather(with: hours)
            }
        } catch {
            print("Error fetching forecast: \(error)")
            // Silent error handling, since we don't need to display anything if there is an error
        }
    }
    
    func getCurrentHourIndex() -> Int? {
        let currentHour = DateFormatterService.shared.format(date: Date(), with: .hourOnly)
        return hoursWeather.firstIndex(where: { $0.time.extractHourAndMinute() == currentHour })
    }
    
    private func updateHoursWeather(with hours: [HourlyForecast]) async {
        await MainActor.run {
            self.hoursWeather = hours
        }
    }
}
