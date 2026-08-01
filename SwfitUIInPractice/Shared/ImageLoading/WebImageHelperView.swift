//
//  WebImageHelperView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct WebImageHelperView: View {
    let urlString: String
    var contentMode: ContentMode = .fit
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: contentMode)
                    .allowsTightening(false)
            }
            .clipped()
    }
}

#Preview {
    WebImageHelperView(urlString: "https://picsum.photos/600/600")
        .clipShape(.rect(cornerRadius: 30))
        .padding()
        .frame(width: 400, height: 400)
}
