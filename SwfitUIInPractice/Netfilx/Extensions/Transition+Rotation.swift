//
//  Transition+Rotation.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/5/26.
//

import SwiftUI

struct RotateTransition: ViewModifier {
    let rotation: Double
    let opacity: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(rotation))
            .opacity(opacity)
    }
}

extension AnyTransition {
    static var rotate: AnyTransition {
        .modifier(
            active: RotateTransition(rotation: 180, opacity: 0),
            identity: RotateTransition(rotation: 0, opacity: 1)
        )
    }
    
    static var rotateClockwise: AnyTransition {
        .modifier(
            active: RotateTransition(rotation: -180, opacity: 0),
            identity: RotateTransition(rotation: 0, opacity: 1)
        )
    }
}
