//
//  Gradient.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 14.01.2024.
//

import Foundation
import SwiftUI

func gradient(for weatherCondition: WeatherConditionType?) -> LinearGradient {
    switch weatherCondition {
    case .sunny:
        return LinearGradient(gradient: Gradient(colors: [.lightYellow, .brightOrange]), startPoint: .top, endPoint: .bottom)
    
    case .partlyCloudy:
        return LinearGradient(gradient: Gradient(colors: [.lightBlue, .mistyWhite]), startPoint: .top, endPoint: .bottom)
    
    case .cloudy, .overcast:
        return LinearGradient(gradient: Gradient(colors: [.lightGrey, .darkGrey]), startPoint: .top, endPoint: .bottom)
    
    case .mist, .fog, .freezingFog:
        return LinearGradient(gradient: Gradient(colors: [.fogGrey, .mistyWhite]), startPoint: .top, endPoint: .bottom)
    
    case .patchyRainPossible, .patchyLightRain, .lightRain, .moderateRainAtTimes, .moderateRain, .heavyRainAtTimes, .heavyRain, .lightRainShower, .moderateOrHeavyRainShower, .torrentialRainShower:
        return LinearGradient(gradient: Gradient(colors: [.rainBlue, .heavyRainGrey]), startPoint: .top, endPoint: .bottom)
    
    case .patchySnowPossible, .patchyLightSnow, .lightSnow, .patchyModerateSnow, .moderateSnow, .patchyHeavySnow, .heavySnow, .blowingSnow, .blizzard, .lightSnowShowers, .moderateOrHeavySnowShowers:
        return LinearGradient(gradient: Gradient(colors: [.blizzardBlue, .snowWhite]), startPoint: .top, endPoint: .bottom)
    
    case .patchySleetPossible, .patchyFreezingDrizzlePossible, .patchyLightDrizzle, .lightDrizzle, .freezingDrizzle, .heavyFreezingDrizzle, .lightFreezingRain, .moderateOrHeavyFreezingRain, .lightSleet, .moderateOrHeavySleet, .lightSleetShowers, .moderateOrHeavySleetShowers, .icePellets, .lightShowersOfIcePellets, .moderateOrHeavyShowersOfIcePellets:
        return LinearGradient(gradient: Gradient(colors: [.sleetGrey, .icyBlue]), startPoint: .top, endPoint: .bottom)
    
    case .thunderyOutbreaksPossible, .patchyLightRainWithThunder, .moderateOrHeavyRainWithThunder, .patchyLightSnowWithThunder, .moderateOrHeavySnowWithThunder:
        return LinearGradient(gradient: Gradient(colors: [.thunderPurple, .darkGrey]), startPoint: .top, endPoint: .bottom)
    
    // Default case if none above
    default:
        return LinearGradient(gradient: Gradient(colors: [.lightGrey, .darkGrey]), startPoint: .top, endPoint: .bottom)
    }
}
