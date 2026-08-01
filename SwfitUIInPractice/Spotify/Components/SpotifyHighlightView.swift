//
//  SpotifyHighlightView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHighlightView: View {
    let imageUrlString: String
    let brand: String
    let category: String
    let title: String
    let description: String
    var onPlusClicked: (() -> Void)? = nil
    var onPlayClicked: (() -> Void)? = nil

    var body: some View {
        VStack {
            brandSection
            
            detailSection
        }
        .foregroundStyle(.spotifyWhite)
    }
    
    private var brandSection: some View {
        HStack(spacing: 15) {
            SpotifyCircularImageView(imageUrlString: imageUrlString)
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                Text(brand.capitalized)
                    .foregroundStyle(.spotifyLightGray)
                    .font(.callout)
                
                Text(category.capitalized)
                    .foregroundStyle(.spotifyWhite)
                    .font(.title)
            }
            Spacer()
        }
    }
    
    private var detailSection: some View {
        HStack {
            ImageLoaderView(urlString: imageUrlString, contentMode: .fill)
                .background(.blue)
                .frame(width: 140, height: 160)
//                    .containerRelativeFrame(.horizontal) { width, _ in
//                        width * 0.4
//                    }
            
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .fontWeight(.semibold)
                    
                    Text(description)
                        .foregroundStyle(.spotifyLightGray)
                        .lineLimit(2)
                }
                .font(.callout)
                
                HStack {
                    Image(systemName: "plus.circle")
                        .font(.title2)
                        .padding(5)
                        .asButton(.press) {
                            onPlusClicked?()
                        }
                    Spacer()
                    
                    Image(systemName: "play.circle.fill")
                        .font(.title)
                        .padding(5)
                }
            }
            .padding(.trailing, 10)
        }
        .spotifyTheme()
        .asButton(.press) {
            onPlayClicked?()
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack
            .ignoresSafeArea()

        let product = sampleProducts.first!

        SpotifyHighlightView(
            imageUrlString: product.thumbnail,
            brand: product.brand ?? "Apple",
            category: product.category,
            title: product.title,
            description: product.description
        )
        .padding()
    }
}
