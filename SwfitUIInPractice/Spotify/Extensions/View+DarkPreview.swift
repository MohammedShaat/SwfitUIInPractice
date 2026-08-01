//
//  View+DarkPreview.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/2/26.
//

import SwiftUI

struct SpotifyPreview: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.spotifyBlack
                .ignoresSafeArea()
            
            content
        }
    }
}

extension View {
    func spotifyPreview() -> some View {
        self
            .modifier(SpotifyPreview())
    }
}
