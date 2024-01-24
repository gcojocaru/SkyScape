//
//  HourlyForecastCell.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 24.01.2024.
//

import SwiftUI

struct HourlyForecastCell: View {
    let forecast: HourlyForecast
    var body: some View {
        HStack {
            WeatherImageView(weatherCondition: WeatherConditionType(rawValue: forecast.condition.code)?.description.symbol,
                             size: 30, foregroundColor: WeatherConditionType(rawValue: forecast.condition.code)!.color)
            VStack {
                Text("\(forecast.temp_c, specifier: "%.0f")°C")
                    .font(.custom("Kollektif", size: 20))
                    .foregroundColor(.gray)
                Text(forecast.time.extractHourAndMinute())
                    .font(.custom("Kollektif", size: 18))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 10)
            .cellBorder
        }
        .padding(8)
    }
    
}
