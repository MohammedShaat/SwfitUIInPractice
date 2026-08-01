//
//  ChipVIew.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import SwiftUI

struct  SpotifyChipView: View {
    let title: String
    let isSelected: Bool
    var foregroundColor: Color = .spotifyWhite
    var backgroundColor: Color = .spotifyDarkGray
    var onClick: (() -> Void)?
    
    var body: some View {
        Button {
            onClick?()
        } label: {
            Text(title)
                .font(.callout)
                .frame(minWidth: 25)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
                .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
                .clipShape(.capsule)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ScrollView(.horizontal) {
        HStack {
            ForEach(0...7, id: \.self) { i in
                SpotifyChipView(
                    title: i == 0 ? "All" : "Music",
                    isSelected: i == 0 ? true : false
                )
            }
        }
        .padding()
    }
    .scrollIndicators(.hidden)
}
