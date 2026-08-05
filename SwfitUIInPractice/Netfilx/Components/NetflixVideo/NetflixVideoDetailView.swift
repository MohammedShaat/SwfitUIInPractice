//
//  NetflixPlaybackView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/5/26.
//

import SwiftUI

struct NetflixVideoDetailView: View {
    let title: String
    let isNew: Bool
    let year: Int
    let seasons: Int
    let isTop: Bool
    let topRating: Int
    let description: String
    let cast: [String]
    
    var body: some View {
        VStack {
            releaseAndRatingSection
            
            playButtonsSection
            
            descriptionAndCastSection
        }
    }
    
    private var releaseAndRatingSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            
            // Release and seasons
            HStack {
                if isNew {
                    Text("New")
                        .foregroundStyle(.green)
                }
                Text("\(year)")
                Text("\(seasons) Seasons")
                Image(systemName: "captions.bubble")
            }
            .foregroundStyle(.netflixLightGray)
            
            // Top
            if isTop {
                HStack {
                    VStack(spacing: -4) {
                        Text("TOP")
                            .font(.caption2)
                        Text("10")
                            .offset(y: -2)
                    }
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.netflixWhite)
                    .fontWeight(.heavy)
                    .padding(2)
                    .background(.netflixRed)
                    
                    Text("#\(topRating) in TV Shows Today")
                        .fontWeight(.bold)
                }
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    
    private var playButtonsSection: some View {
        VStack {
            NetflixButtonView(title: "Play", systemName: "play.fill", foregroundColor: .netflixDarkGray, backgroundColor: .netflixWhite)
            
            NetflixButtonView(title: "Download", systemName: "arrow.down.to.line.alt")
        }
        .padding(.horizontal)
    }
    
    
    private var descriptionAndCastSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(description)
            
            HStack {
                Text("Cast:")
                
                Text(cast.joined(separator: ", "))
            }
            .foregroundStyle(.netflixLightGray)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    let product = sampleProducts[0]
    
    ZStack {
        
    }
    .sheet(item: .constant(true)) { _ in
        VStack {
            NetflixVideoDetailView(
                title: product.title,
                isNew: product.isNew,
                year: product.year,
                seasons: product.seasons,
                isTop: product.isTop,
                topRating: product.topRating,
                description: product.description,
                cast: product.cast
            )
                .frame(maxWidth: .infinity, maxHeight: 200)
        }
    }
    .netflixTheme()
}
