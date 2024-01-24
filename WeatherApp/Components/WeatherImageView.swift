//
//  WeatherImageView.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import SwiftUI

struct WeatherImageView: View {
    var weatherCondition: String?
    var size: CGFloat = 100
    var foregroundColor: Color = .white
    var body: some View {
        Image(systemName: weatherCondition ?? "")
            .imageScale(.large)
            .font(.system(size: size))
            .foregroundColor(foregroundColor)
    }
}

#Preview {
    WeatherImageView(weatherCondition: "cloud.rain.fill")
}
