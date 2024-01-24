//
//  TodaysWeatherViewModel.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 11.01.2024.
//

import Foundation
import Combine

enum TodayViewModelState {
    case idle
    case loading
    case success(TodaysWeather)
    case failure(String)
}

struct TodaysWeather {
    var temperature: String
    var feelsLikeTemperature: String
    var humidity: String
    var uvIndex: String
    var rain: String
    var wind: String
    var weatherCondition: WeatherConditionType
    var todaysDate: String
}

/// Protocol defining the necessary properties and functions for today's weather view model.
protocol TodaysWeatherViewModelContentable {
    /// Called when the view appears.
    func onAppear()
    var state: TodayViewModelState { get }
}

@Observable
final class TodaysWeatherViewModel: TodaysWeatherViewModelContentable {
    var weatherService: WeatherService
    private(set) var state: TodayViewModelState = .idle
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func onAppear() {
        loadWeather()
    }
    
    private func loadWeather() {
        state = .loading
        Task { [weak self] in
            await self?.fetchWeather()
        }
    }
    
    private func fetchWeather() async {
        do {
            let weatherObject = try await weatherService.fetchWeather(forCity: "Chisinau")
            guard let currentWeather = weatherObject.current else {
                state = .failure("Weather data not available.")
                return
            }
            let todaysWeather = TodaysWeather(
                temperature: formatTemperature(currentWeather.temp_c),
                feelsLikeTemperature: formatTemperature(currentWeather.feelslike_c, suffix: "°C"),
                humidity: "\(currentWeather.humidity)%",
                uvIndex: "\(currentWeather.uv)",
                rain: "\(currentWeather.precip_mm)%",
                wind: "\(currentWeather.wind_kph) km/h",
                weatherCondition: WeatherConditionType(rawValue: currentWeather.condition.code)!,
                todaysDate: DateFormatterService.shared.format(date: Date(), with: .dayMonthDayOfWeek)
            )
            await MainActor.run {
                state = .success(todaysWeather)
            }
        } catch {
            state = .failure("Failed to fetch weather: \(error.localizedDescription)")
        }
    }
    
    private func formatTemperature(_ value: Double, suffix: String = "") -> String {
        return String(format: "%g%@", value, suffix)
    }
}

