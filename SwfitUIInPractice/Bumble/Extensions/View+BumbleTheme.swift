//
//  View+BumbleTheme.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/3/26.
//

import SwiftUI

extension View {
    func bumbleTheme() -> some View {
        ZStack {
            Color.bumbleWhite
                .ignoresSafeArea()
            
            self
        }
    }
}
