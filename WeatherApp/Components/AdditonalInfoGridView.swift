//
//  AditonalInfoGridView.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import SwiftUI

struct AdditionalInfoGridView: View {
    var viewModel: TodaysWeather

    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 50, maximum: 400), spacing: 0), count: 2)
        LazyVGrid(columns: columns, spacing: 0) {
            AdditionalInfoDetail(title: "Humidity", value: viewModel.humidity)
            AdditionalInfoDetail(title: "UV Index", value: "\(viewModel.uvIndex ?? "")/10")
                .border(width: 0.5, edges: [.leading], color: .white)
            AdditionalInfoDetail(title: "Rain", value: viewModel.rain)
                .border(width: 0.5, edges: [.top], color: .white)
            AdditionalInfoDetail(title: "Wind", value: viewModel.wind)
                .border(width: 0.5, edges: [.top, .leading], color: .white)
        }
        .padding()
    }
}

#Preview {
    AdditionalInfoGridView(viewModel: TodaysWeather(temperature: "", feelsLikeTemperature: "", humidity: "", uvIndex: "", rain: "", wind: "", weatherCondition: WeatherConditionType(rawValue: 1)!, todaysDate: ""))
}
