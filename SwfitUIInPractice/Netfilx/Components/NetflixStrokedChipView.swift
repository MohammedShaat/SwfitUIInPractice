//
//  NetfilxStrokedChipView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/4/26.
//

import SwiftUI

struct NetflixStrokedChipView: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(isSelected ? .netflixDarkGray : .clear)
            .clipShape(.capsule)
            .overlay(
                Capsule()
                    .stroke()
            )
            .foregroundStyle(.netflixLightGray)
    }
}

#Preview {
    VStack(spacing: 16) {
        NetflixStrokedChipView(title: "Movies", isSelected: false)
        NetflixStrokedChipView(title: "Series", isSelected: true)
    }
    .netflixTheme()
}
