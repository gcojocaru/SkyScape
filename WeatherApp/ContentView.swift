//
//  ContentView.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 11.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TodaysWeatherView(viewModel: TodaysWeatherViewModel(weatherService: WeatherService()))
    }
}

#Preview {
    ContentView()
}
