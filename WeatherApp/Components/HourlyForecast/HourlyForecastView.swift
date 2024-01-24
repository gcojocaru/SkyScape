//
//  HourlyForecastView.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import SwiftUI

struct HourlyForecastView<ViewModel>: View where ViewModel: HourlyForecastViewModel {
    @ObservedObject var viewModel: ViewModel
    @State private var scrollToHourIndex: Int? // The index to scroll to
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.hoursWeather, id: \.self) { forecast in
                        HourlyForecastCell(forecast: forecast)
                            .animation(.easeInOut, value: viewModel.hoursWeather)
                            .id(viewModel.hoursWeather.firstIndex(of: forecast))
                    }
                }
                .backgroundStyle
            }
            .onAppear {
                Task {
                    await viewModel.getTwelveHourForecast()
                    scrollToHourIndex = viewModel.getCurrentHourIndex()
                    if let index = scrollToHourIndex {
                        proxy.scrollTo(index, anchor: .center)
                    }
                }
            }
        }
    }
}

// View Modifiers
extension View {
    var backgroundStyle: some View {
        self
            .background(
                VisualEffectBlur(blurStyle: .light) {
                    RoundedRectangle(cornerRadius: 35.0)
                        .fill(Color.white.opacity(0.8)) // Adjust opacity for desired transparency
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 35.0))
            .padding()
            .shadow(radius: 3)
    }
    
    
    var cellBorder: some View {
        self.border(width: 1, edges: [.trailing], color: Color(uiColor: .lightGray))
    }
}





#Preview {
    HourlyForecastView(viewModel: HourlyForecastViewModel(weatherService: WeatherService()))
}
