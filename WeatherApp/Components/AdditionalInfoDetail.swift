//
//  AdditionalInfoDetail.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import SwiftUI

struct AdditionalInfoDetail: View {
    let title: String
    let value: String?

    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Kollektif", size: 18))
                .foregroundColor(.white)
            Spacer()
            Text(value ?? "")
                .font(.custom("Kollektif-Bold", size: 18))
                .foregroundColor(.white)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 15)
    }
}

#Preview {
    AdditionalInfoDetail(title: "Title", value: "Subtitle")
}
