//
//  DateFormatter+Extension.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import Foundation
extension DateFormatter {
    static func dateFormatterWith(format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }
}
