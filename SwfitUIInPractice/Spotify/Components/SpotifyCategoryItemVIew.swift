//
//  SpotifyCategoryItemVIew.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import SwiftUI

struct SpotifyCategoryItemVIew: View {
    let imageUrlString: String
    let title: String
    var imageSize: CGFloat = 150
    
    var body: some View {
        VStack(spacing: 16) {
            ImageLoaderView(urlString: imageUrlString)
                .frame(width: imageSize, height: imageSize)
                .background(.spotifyWhite)
            
            Text(title)
                .foregroundStyle(.spotifyLightGray)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .fontWeight(.semibold)
                .padding(.horizontal)
                
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.spotifyDarkGray
            .ignoresSafeArea()
        
        ScrollView(.horizontal) {
            HStack(alignment: .top) {
                ForEach(sampleProducts) { product in
                    SpotifyCategoryItemVIew(imageUrlString: product.thumbnail, title: product.title)
                }
            }
        }
    }
}
