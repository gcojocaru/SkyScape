//
//  TabBarModifier.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 15.01.2024.
//

import Foundation
import SwiftUI

struct TabBarModifier: ViewModifier {
    var backgroundColor: UIColor

    init(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        UITabBar.appearance().backgroundColor = backgroundColor
    }

    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func tabBarBackgroundColor(_ backgroundColor: UIColor) -> some View {
        self.modifier(TabBarModifier(backgroundColor: backgroundColor))
    }
}
