//
//  TemperatureView.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import SwiftUI

struct TemperatureView: View {
    let temperature: String?
    let feelsLikeTemperature: String?

    var body: some View {
        HStack(spacing: 25) {
            HStack {
                Text(temperature ?? "")
                    .font(.custom("Kollektif-Bold", size: 80))
                    .foregroundColor(.white)
                Text("°C")
                    .font(.custom("Kollektif", size: 80))
                    .foregroundColor(.white)
            }
            VStack(alignment: .leading) {
                Text("feels like")
                    .font(.custom("Kollektif", size: 20))
                    .foregroundColor(.white)
                Text(feelsLikeTemperature ?? "")
                    .font(.custom("Kollektif-Bold", size: 20))
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    TemperatureView(temperature: "2", feelsLikeTemperature: "3")
}
