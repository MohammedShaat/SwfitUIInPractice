//
//  SpotifyItemView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import SwiftUI

struct SpotifyRecentItemView: View {
    let imageUrlStr: String
    let title: String
    
    var body: some View {
        HStack {
            ImageLoaderView(urlString: imageUrlStr)
                .background(.spotifyWhite)
//                .containerRelativeFrame(.horizontal) { width, _ in
//                    width * 0.2
//                }
                .frame(width: 65, height: 65)
            
            VStack {
                Text(title)
                    .lineLimit(2)
                    .font(.headline)
            }
            Spacer()
        }
        .spotifyTheme()
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack
            .ignoresSafeArea()
        
        let product1 = sampleProducts[0]
        let product2 = sampleProducts[1]
        
        HStack(spacing: 10) {
            SpotifyRecentItemView(imageUrlStr: product1.thumbnail, title: product1.title)
            SpotifyRecentItemView(imageUrlStr: product2.thumbnail, title: product2.title)
        }
    }
}
