//
//  TodaysWeatherView.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 11.01.2024.
//

import SwiftUI

// Main Weather View
struct TodaysWeatherView<ViewModel>: View where ViewModel: TodaysWeatherViewModelContentable {
    
    @State var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            switch(viewModel.state) {
            case .loading:
                    LoadingView()
            case .failure(let errorMessage):
                ErrorView(errorMessage: errorMessage ,onRetry: {
                    viewModel.onAppear()
                })
            case .success(let todaysWeather):
                ZStack {
                    BackgroundView(weatherType: todaysWeather.weatherCondition)
                    WeatherInfoView(todayWeather: todaysWeather, onRefresh: {viewModel.onAppear()})
                }
            case .idle:
                ZStack{}
            }
        }
        .onAppear {
            withAnimation {
                viewModel.onAppear()
            }
        }
    }
}

// Weather Information View
struct WeatherInfoView: View {
    var todayWeather: TodaysWeather
    var onRefresh: () -> Void
    var body: some View {
        ScrollView {
            VStack {
                DateAndLocationView(date: todayWeather.todaysDate, location: "Chisinau")
                WeatherImageView(weatherCondition: todayWeather.weatherCondition.description.symbol)
                    .padding(.bottom, 25)
                TemperatureView(temperature: todayWeather.temperature, feelsLikeTemperature: todayWeather.feelsLikeTemperature)
                AdditionalInfoGridView(viewModel: todayWeather)
                HourlyForecastView(viewModel: HourlyForecastViewModel(weatherService: WeatherService()))
                Spacer()
            }
        }
        .refreshable {
            withAnimation {
                onRefresh()
            }
        }
    }
}

// Subviews
struct BackgroundView: View {
    var weatherType: WeatherConditionType?
    var body: some View {
        Rectangle()
            .fill(
                gradient(for: weatherType)
            )
            .edgesIgnoringSafeArea(.all)
    }
}

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            // Background layer
            Color.black.opacity(0.75).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Spinner
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
                
                // Loading Text
                Text("Loading...")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}


struct ErrorView: View {
    var errorMessage: String
    var onRetry: () -> Void
    var body: some View {
        VStack(spacing: 25) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(.orange)
            
            Text("Ooops")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(errorMessage)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Button(action: {
                onRetry()
            }) {
                Text("Retry")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(30)
                    .shadow(radius: 3)
            }
            .padding(.horizontal, 30)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(.systemBackground))
                .shadow(radius: 5)
        )
        .padding()
    }
}

// Preview
struct TodaysWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodaysWeatherView(viewModel: TodaysWeatherViewModel(weatherService: WeatherService()))
    }
}

