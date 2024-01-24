//
//  WeatherCondition.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import Foundation
import SwiftUI

enum WeatherConditionType: Int {
    case sunny = 1000
    case partlyCloudy = 1003
    case cloudy = 1006
    case overcast = 1009
    case mist = 1030
    case patchyRainPossible = 1063
    case patchySnowPossible = 1066
    case patchySleetPossible = 1069
    case patchyFreezingDrizzlePossible = 1072
    case thunderyOutbreaksPossible = 1087
    case blowingSnow = 1114
    case blizzard = 1117
    case fog = 1135
    case freezingFog = 1147
    case patchyLightDrizzle = 1150
    case lightDrizzle = 1153
    case freezingDrizzle = 1168
    case heavyFreezingDrizzle = 1171
    case patchyLightRain = 1180
    case lightRain = 1183
    case moderateRainAtTimes = 1186
    case moderateRain = 1189
    case heavyRainAtTimes = 1192
    case heavyRain = 1195
    case lightFreezingRain = 1198
    case moderateOrHeavyFreezingRain = 1201
    case lightSleet = 1204
    case moderateOrHeavySleet = 1207
    case patchyLightSnow = 1210
    case lightSnow = 1213
    case patchyModerateSnow = 1216
    case moderateSnow = 1219
    case patchyHeavySnow = 1222
    case heavySnow = 1225
    case icePellets = 1237
    case lightRainShower = 1240
    case moderateOrHeavyRainShower = 1243
    case torrentialRainShower = 1246
    case lightSleetShowers = 1249
    case moderateOrHeavySleetShowers = 1252
    case lightSnowShowers = 1255
    case moderateOrHeavySnowShowers = 1258
    case lightShowersOfIcePellets = 1261
    case moderateOrHeavyShowersOfIcePellets = 1264
    case patchyLightRainWithThunder = 1273
    case moderateOrHeavyRainWithThunder = 1276
    case patchyLightSnowWithThunder = 1279
    case moderateOrHeavySnowWithThunder = 1282

    var description: (dayDescription: String, symbol: String) {
        switch self {
        case .sunny:
            return ("Sunny", "sun.max.fill")
        case .partlyCloudy:
            return ("Partly cloudy", "cloud.sun.fill")
        case .cloudy:
            return ("Cloudy", "cloud.fill")
        case .overcast:
            return ("Overcast", "smoke.fill")
        case .mist:
            return ("Mist", "cloud.fog.fill")
        case .patchyRainPossible, .moderateOrHeavyRainShower:
            return ("Patchy rain possible", "cloud.drizzle.fill")
        case .patchySnowPossible:
            return ("Patchy snow possible", "cloud.snow.fill")
        case .patchySleetPossible:
            return ("Patchy sleet possible", "cloud.sleet.fill")
        case .patchyFreezingDrizzlePossible:
            return ("Patchy freezing drizzle possible", "cloud.hail.fill")
        case .thunderyOutbreaksPossible:
            return ("Thundery outbreaks possible", "cloud.bolt.rain.fill")
        case .blowingSnow:
            return ("Blowing snow", "wind.snow")
        case .blizzard:
            return ("Blizzard", "snowflake")
        case .fog:
            return ("Fog", "cloud.fog.fill")
        case .freezingFog:
            return ("Freezing fog", "cloud.fog.fill")
        case .patchyLightDrizzle:
            return ("Patchy light drizzle", "cloud.drizzle.fill")
        case .lightDrizzle:
            return ("Light drizzle", "cloud.drizzle.fill")
        case .freezingDrizzle:
            return ("Freezing drizzle", "cloud.hail.fill")
        case .heavyFreezingDrizzle:
            return ("Heavy freezing drizzle", "cloud.hail.fill")
        case .patchyLightRain:
            return ("Patchy light rain", "cloud.rain.fill")
        case .lightRain:
            return ("Light rain", "cloud.rain.fill")
        case .moderateRainAtTimes:
            return ("Moderate rain at times", "cloud.rain.fill")
        case .moderateRain:
            return ("Moderate rain", "cloud.rain.fill")
        case .heavyRainAtTimes:
            return ("Heavy rain at times", "cloud.heavyrain.fill")
        case .heavyRain:
            return ("Heavy rain", "cloud.heavyrain.fill")
        case .lightFreezingRain:
            return ("Light freezing rain", "cloud.sleet.fill")
        case .moderateOrHeavyFreezingRain:
            return ("Moderate or heavy freezing rain", "cloud.sleet.fill")
        case .lightSleet:
            return ("Light sleet", "cloud.sleet.fill")
        case .moderateOrHeavySleet:
            return ("Moderate or heavy sleet", "cloud.sleet.fill")
        case .patchyLightSnow:
            return ("Patchy light snow", "cloud.snow.fill")
        case .lightSnow:
            return ("Light snow", "cloud.snow.fill")
        case .patchyModerateSnow:
            return ("Patchy moderate snow", "cloud.snow.fill")
        case .moderateSnow:
            return ("Moderate snow", "cloud.snow.fill")
        case .patchyHeavySnow:
            return ("Patchy heavy snow", "cloud.snow.fill")
        case .heavySnow:
            return ("Heavy snow", "cloud.snow.fill")
        case .icePellets:
            return ("Ice pellets", "cloud.hail.fill")
        case .lightRainShower:
            return ("Light rain shower", "cloud.drizzle.fill")
        case .moderateOrHeavyRainShower:
            return ("Moderate or heavy rain shower", "cloud.rain.fill")
        case .torrentialRainShower:
            return ("Torrential rain shower", "cloud.heavyrain.fill")
        case .lightSleetShowers:
            return ("Light sleet showers", "cloud.sleet.fill")
        case .moderateOrHeavySleetShowers:
            return ("Moderate or heavy sleet showers", "cloud.sleet.fill")
        case .lightSnowShowers:
            return ("Light snow showers", "cloud.snow.fill")
        case .moderateOrHeavySnowShowers:
            return ("Moderate or heavy snow showers", "cloud.snow.fill")
        case .lightShowersOfIcePellets:
            return ("Light showers of ice pellets", "cloud.hail.fill")
        case .moderateOrHeavyShowersOfIcePellets:
            return ("Moderate or heavy showers of ice pellets", "cloud.hail.fill")
        case .patchyLightRainWithThunder:
            return ("Patchy light rain with thunder", "cloud.bolt.rain.fill")
        case .moderateOrHeavyRainWithThunder:
            return ("Moderate or heavy rain with thunder", "cloud.bolt.rain.fill")
        case .patchyLightSnowWithThunder:
            return ("Patchy light snow with thunder", "cloud.bolt.rain.fill")
        case .moderateOrHeavySnowWithThunder:
            return ("Moderate or heavy snow with thunder", "cloud.bolt.snow.fill")
        }
    }
}

extension WeatherConditionType {
    var color: Color {
            switch self {
            case .sunny:
                return Color.sunnyYellow
            case .partlyCloudy:
                return Color.lightBlueSky
            case .cloudy, .overcast, .fog, .freezingFog, .mist:
                return Color.cloudyGrey
            case .patchyRainPossible, .lightDrizzle, .patchyLightDrizzle, .lightRain, .patchyLightRain, .lightRainShower, .moderateOrHeavyRainShower:
                return Color.lightGreenRain
            case .patchySnowPossible, .lightSnow, .patchyLightSnow, .lightSnowShowers:
                return Color.snowBlue
            case .patchySleetPossible, .lightSleet, .lightSleetShowers:
                return Color.tealSleet
            case .patchyFreezingDrizzlePossible, .freezingDrizzle, .heavyFreezingDrizzle, .lightFreezingRain, .moderateOrHeavyFreezingRain:
                return Color.purpleFreezing
            case .thunderyOutbreaksPossible, .patchyLightRainWithThunder, .moderateOrHeavyRainWithThunder, .patchyLightSnowWithThunder, .moderateOrHeavySnowWithThunder:
                return Color.darkGreyThunder
            case .blowingSnow, .blizzard:
                return Color.whiteSnow
            case .moderateRain, .moderateRainAtTimes:
                return Color.darkGreenRain
            case .heavyRain, .heavyRainAtTimes, .torrentialRainShower:
                return Color.deepBlueHeavyRain
            case .moderateOrHeavySleet, .moderateOrHeavySleetShowers:
                return Color.darkTeal
            case .patchyModerateSnow, .moderateSnow, .moderateOrHeavySnowShowers:
                return Color.mediumBlueSnow
            case .patchyHeavySnow, .heavySnow:
                return Color.darkBlueHeavySnow
            case .icePellets, .lightShowersOfIcePellets, .moderateOrHeavyShowersOfIcePellets:
                return Color.lightGreyIce
            }
        }
}

