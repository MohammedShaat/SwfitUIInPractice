//
//  SpotifyPlaylistSimilarView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/2/26.
//

import SwiftUI

struct SpotifyPlaylistSimilarView: View {
    let imageUrlString: String
    let title: String
    let category: String
    var onViewClick: (() -> Void)? = nil
    var onMoreClick: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            ImageLoaderView(urlString: imageUrlString)
                .frame(width: 60, height: 60)
                .background(.spotifyWhite)
            
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.bold)
                    .lineLimit(1)
                
                Text(category.capitalized)
                    .foregroundStyle(.spotifyLightGray)
            }
            Spacer()
            
            Image(systemName: "ellipsis")
                .padding(8)
                .onTapGesture {
                    onMoreClick?()
                }
        }
        .foregroundStyle(.spotifyWhite)
        .onTapGesture {
            onViewClick?()
        }
    }
}

#Preview {
    let product = sampleProducts[0]
    
    SpotifyPlaylistSimilarView(imageUrlString: product.thumbnail, title: product.title, category: product.category)
        .spotifyPreview()
}
