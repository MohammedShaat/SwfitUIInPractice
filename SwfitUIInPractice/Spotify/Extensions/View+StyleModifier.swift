//
//  View+StyleModifier.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import SwiftUI

extension View {
    func spotifyTheme() -> some View {
        self
            .foregroundStyle(.spotifyWhite)
            .background(.spotifyDarkGray)
    }
}
