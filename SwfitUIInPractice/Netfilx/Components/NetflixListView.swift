//
//  NetflixListView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/5/26.
//

import SwiftUI
import SwiftfulUI

struct NetflixListView: View {
    let title: String
    let prodcuts: [Product]
    var isIndexed: Bool = false
    var onItemClicked: ((Product) -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title.capitalized)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.netflixWhite)
                .padding()
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 16) {
                    ForEach(prodcuts.enumerated(), id: \.element.id) { (index, product) in
                        Group {
                            if isIndexed {
                                NetflixIndexedItemVIew(imageUrlString: product.thumbnail, title: product.title, index: index + 1)
                                    .frame(width: 120)
                            } else {
                                NetflixItemVIew(imageUrlString: product.thumbnail, title: product.title, recentlyAdded: product.recentlyAdded)
                                    .frame(width: 100)
                            }
                        }
                        .asButton(.press) {
                            onItemClicked?(product)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    VStack(spacing: 50) {
        NetflixListView(title: "Beautly", prodcuts: sampleProducts)
            .frame(height: 200)
        
        NetflixListView(title: "Beautly", prodcuts: sampleProducts, isIndexed: true)
            .frame(height: 200)
    }
        .netflixTheme()
}
