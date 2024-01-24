//
//  BlurView.swift
//  WeatherApp
//
//  Created by Gheorghe Cojocaru on 12.01.2024.
//

import SwiftUI
import UIKit

struct VisualEffectBlur<Content: View>: View {
    var blurStyle: UIBlurEffect.Style
    var content: Content

    init(blurStyle: UIBlurEffect.Style = .systemMaterial, @ViewBuilder content: () -> Content) {
        self.blurStyle = blurStyle
        self.content = content()
    }

    var body: some View {
        ZStack {
            BlurView(blurStyle: blurStyle)
            content
        }
    }
}

struct BlurView: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: blurStyle)
    }
}

