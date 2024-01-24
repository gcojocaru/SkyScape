//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 11.01.2024.
//

import Foundation


class WeatherService {
    func fetchWeather(forCity city: String) async throws -> WeatherResponse {
        let apiKey = "ac6cf0b1194f4009a9d74219241101"
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.weatherapi.com"
        components.path = "/v1/current.json"
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "aqi", value: "no")
        ]

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse
    }
    
    
    func fetchWeatherForecast(forCity city: String, date: String) async throws -> [HourlyForecast]? {
        let apiKey = "ac6cf0b1194f4009a9d74219241101"
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.weatherapi.com"
        components.path = "/v1/history.json"
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "aqi", value: "no"),
            URLQueryItem(name: "dt", value: date),
            
        ]

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse.forecast?.forecastday.first?.hour
    }


}
