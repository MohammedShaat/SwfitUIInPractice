//
//  NetflicItemVIew.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/5/26.
//

import SwiftUI
import SwiftfulUI

struct NetflixIndexedItemVIew: View {
    let imageUrlString: String
    let title: String
    let index: Int
    
    @State private var containerSize: CGSize = .zero
    
    var body: some View {
        ZStack {
            Text(index, format: .number)
                .foregroundStyle(.netflixRed)
                .font(.system(size: 100, design: .serif))
                .offset(y: 22)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            
            NetflixItemVIew(
                imageUrlString: imageUrlString,
                title: title,
                recentlyAdded: false,
                backgroundColor: .clear,
                foregroundColor: .netflixBlack
            )
            .frame(width: containerSize.width * 0.8, height: containerSize.height * 0.8)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        .frame(maxWidth: .infinity)
        .background(.netflixLightGray)
        .clipShape(.rect(cornerRadius: 5))
        .readingFrame { frame in
            containerSize = frame.size
        }
    }
}

#Preview {
    let product = sampleProducts[0]
    
    ScrollView(.horizontal) {
        LazyHStack(spacing: 20) {
            ForEach(0...10, id: \.self) { i in
                NetflixIndexedItemVIew(imageUrlString: product.thumbnail, title: product.title, index: i + 1)
                    .frame(width: 150, height: 150)
            }
        }
        .padding()
    }
    .netflixTheme()
}
