//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 11.01.2024.
//

import SwiftUI
import Foundation

@main
struct WeatherAppApp: App {
    
    enum TabBarTag: String {
        case sunView
        case todayView
        case brainView
    }
    
    @State private var tabBarTag: String = TabBarTag.todayView.rawValue
    
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $tabBarTag) {
                Text("SUN VIEW")
                    .tabItem {
                        Image(systemName: "sun.max.fill")
                    }
                    .tag(TabBarTag.sunView.rawValue)
                
                TodaysWeatherView(viewModel: TodaysWeatherViewModel(weatherService: WeatherService()))
                    .tabItem {
                        Image(systemName: "safari.fill")
                    }
                    .tag(TabBarTag.todayView.rawValue)
                
                
                Text("BRAIN VIEW")
                    .tabItem {
                        Image(systemName: "brain")
                    }
                    .tag(TabBarTag.brainView.rawValue)
                
            }
            .tabBarBackgroundColor(.white)
            .tint(.orange)
        }
    }
}
