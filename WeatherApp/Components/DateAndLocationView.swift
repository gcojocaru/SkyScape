//
//  DateAndLocationView.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import SwiftUI

struct DateAndLocationView: View {
    let date: String
    let location: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(date)
                    .font(.custom("Kollektif", size: 20))
                    .foregroundColor(.white)
                Text(location)
                    .font(.custom("Kollektif-Bold", size: 20))
                    .foregroundColor(.white)
            }
            .padding()
            Spacer()
        }
    }
}


#Preview {
    DateAndLocationView(date: "12 January, Friday", location: "Chisinau")
}
