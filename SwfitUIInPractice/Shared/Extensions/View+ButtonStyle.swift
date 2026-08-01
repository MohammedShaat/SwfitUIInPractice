//
//  View+ButtonStyle.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/2/26.
//

import SwiftUI

struct AsButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
}

extension View {
    func asButton(action: (() -> Void)? = nil) -> some View {
        Button {
            action?()
        } label: {
            self
        }
        .buttonStyle(AsButtonStyle())
    }
}
