//
//  String+Exension.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import Foundation
extension String {
    func extractHourAndMinute() -> String {
        guard let date = DateFormatter.dateFormatterWith(format: "yyyy-MM-dd HH:mm").date(from: self) else {
            return ""
        }
        return DateFormatter.dateFormatterWith(format: "HH:mm").string(from: date)
    }
}
