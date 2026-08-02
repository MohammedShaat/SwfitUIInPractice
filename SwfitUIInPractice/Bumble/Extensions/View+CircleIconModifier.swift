//
//  View+CircleIconModifier.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/3/26.
//

import SwiftUI

struct CircleIcon: ViewModifier {
    var font: Font = .title
    var padding: Double = 16
    var backgroundColor: Color = .bumbleYellow
    
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .font(font)
            .fontWeight(.semibold)
            .background(backgroundColor)
            .clipShape(.circle)
    }
}


extension View {
    func circleIcon(font: Font = .title, padding: Double = 16, backgroundColor: Color = .bumbleYellow) -> some View {
        self
            .modifier(CircleIcon(font: font, padding: padding, backgroundColor: backgroundColor))
    }
}
