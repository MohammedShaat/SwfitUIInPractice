//
//  SpotifyNavigationBarView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/2/26.
//

import SwiftUI
import SwiftfulUI

struct SpotifyNavigationBarView: View {
    let title: String
    let showingTitle: Bool
    var onBackClicked: (() -> Void)? = nil
    
    var body: some View {
        VStack {
            ZStack {
                Text(title)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.spotifyBlack)
                    .opacity(showingTitle ? 1 : 0)
                    .offset(y: showingTitle ? 0 : -20)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(8)
                    .background(
                        Color.spotifyBlack.opacity(0.4)
                            .opacity(showingTitle ? 0 : 1)
                    )
                    .asButton(.press) {
                        onBackClicked?()
                    }
                    .clipShape(.circle)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundStyle(.spotifyWhite)
            Spacer()
        }
    }
}

#Preview {
    ScrollView {
        LazyVStack {
            SpotifyNavigationBarView(title: "Apple", showingTitle: true)
                .spotifyPreview()
        }
    }
    
}
