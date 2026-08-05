//
//  View+NetflixTheme.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/4/26.
//

import SwiftUI

extension View {
    func netflixTheme() -> some View {
        ZStack {
            LinearGradient(colors: [.netflixDarkRed, .netflixBlack], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            self
        }
    }
}
