//
//  Color+Extension.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 11.01.2024.
//

import Foundation
import SwiftUI

extension Color {
    static var mainColor: Color {
        Color("MainColor")
    }
    
    static var accentColor1: Color  {
        Color("AccentColor ")
        
    }
    
    static var secondaryColor: Color {
        Color("SecondaryColor")
    }
    
}

extension Color {
    // Original color definitions
    static let lightYellow = Color.yellow
    static let brightOrange = Color.orange
    static let lightBlue = Color.blue.opacity(0.7)
    static let darkBlue = Color.blue
    static let lightGrey = Color.gray.opacity(0.5)
    static let darkGrey = Color.gray
    static let mistyWhite = Color.white
    static let thunderPurple = Color.purple
    static let icyBlue = Color.blue.opacity(0.5)
    static let snowWhite = Color.white
    
    // Additional color definitions to cover all cases
    static let fogGrey = Color.gray.opacity(0.8)
    static let sleetGrey = Color.gray.opacity(0.8)
    static let heavyRainGrey = Color.gray.opacity(0.9)
    static let blizzardBlue = Color.blue.opacity(0.4)
    static let rainBlue = Color.blue.opacity(0.6)
    // More colors can be added as needed
    
    
    // Sunny Yellow: Represents bright and sunny weather.
    static let sunnyYellow = Color(hex: "FFD700")
    
    // Light Blue Sky: Suggests partly cloudy or clear skies.
    static let lightBlueSky = Color(hex: "ADD8E6")
    
    // Cloudy Grey: Indicates overcast or cloudy weather.
    static let cloudyGrey = Color(hex: "808080")
    
    // Light Green Rain: Represents light rain or drizzle.
    static let lightGreenRain = Color(hex: "90EE90")
    
    // Snow Blue: Used for snowy weather conditions.
    static let snowBlue = Color(hex: "87CEFA")
    
    // Teal Sleet: Indicates sleet or wintry mix.
    static let tealSleet = Color(hex: "008080")
    
    // Purple Freezing: Represents freezing rain or drizzle.
    static let purpleFreezing = Color(hex: "800080")
    
    // Dark Grey Thunder: For thunderstorms or severe weather.
    static let darkGreyThunder = Color(hex: "A9A9A9")
    
    // White Snow: Used for blizzard or heavy snow conditions.
    static let whiteSnow = Color(hex: "FFFFFF")
    
    // Dark Green Rain: Indicates moderate or heavy rain.
    static let darkGreenRain = Color(hex: "006400")
    
    // Deep Blue Heavy Rain: Symbolizes intense rainfall.
    static let deepBlueHeavyRain = Color(hex: "00008B")
    
    // Dark Teal: Used for heavy sleet.
    static let darkTeal = Color(hex: "005757")
    
    // Medium Blue Snow: Indicates moderate snowfall.
    static let mediumBlueSnow = Color(hex: "1E90FF")
    
    // Dark Blue Heavy Snow: Used for heavy snow conditions.
    static let darkBlueHeavySnow = Color(hex: "0000CD")
    
    // Light Grey Ice: Represents ice pellets or freezing conditions.
    static let lightGreyIce = Color(hex: "D3D3D3")
    
    // Hex string initializer
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
        let b = Double(rgbValue & 0xff) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

