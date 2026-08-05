//
//  NetflicItemVIew.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/5/26.
//

import SwiftUI
import SwiftfulUI

struct NetflixItemVIew: View {
    let imageUrlString: String
    let title: String
    let recentlyAdded: Bool
    var backgroundColor: Color = .netflixLightGray
    var foregroundColor: Color = .netflixWhite
    
    @State private var containerSize: CGSize = .zero
    
    var body: some View {
        VStack(spacing: 0) {
            ImageLoaderView(urlString: imageUrlString, contentMode: .fit)
                .frame(width: containerSize.width, height: containerSize.width)
                .background(backgroundColor)
                .clipShape(.rect(cornerRadius: 5))
            
            VStack(spacing: 4) {
                Text(title)
                    .padding(.horizontal)
                    .lineLimit(1)
                
                if recentlyAdded{
                    Text("Recently Added")
                        .padding(2)
                        .background(.netflixRed)
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(foregroundColor)
        }
        .readingFrame { frame in
            containerSize = frame.size
        }
    }
}

#Preview {
    let product = sampleProducts[0]
    
    ScrollView(.horizontal) {
        LazyHStack(alignment: .top, spacing: 20) {
            ForEach(0...10, id: \.self) { _ in
                NetflixItemVIew(imageUrlString: product.thumbnail, title: product.title, recentlyAdded: Bool.random())
//                    .frame(width: 120, height: 150)
                    .frame(width: 120)
            }
        }
        .padding()
    }
    .netflixTheme()
}
