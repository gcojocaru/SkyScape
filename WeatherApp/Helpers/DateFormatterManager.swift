//
//  DateFormatterManager.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 24.01.2024.
//

import Foundation

enum DateFormatType {
    case fullDateWithTime
    case hourOnly
    case dateOnly
    case dayMonthDayOfWeek
    
    var stringValue: String {
        switch self {
        case .fullDateWithTime:
            return "yyyy-MM-dd HH:mm"
        case .hourOnly:
            return "HH:00"
        case .dateOnly:
            return "yyyy-MM-dd"
        case .dayMonthDayOfWeek:
            return "d MMMM, EEEE"
        }
    }
}


class DateFormatterService {
    static let shared = DateFormatterService()
    
    private let formatter: DateFormatter
    
    private init() {
        formatter = DateFormatter()
    }
    
    func format(date: Date, with formatType: DateFormatType) -> String {
        synchronized(self) {
            formatter.dateFormat = formatType.stringValue
            return formatter.string(from: date)
        }
    }
    
    private func synchronized(_ lock: Any, closure: () -> String) -> String {
        objc_sync_enter(lock)
        defer { objc_sync_exit(lock) }
        return closure()
    }
}

