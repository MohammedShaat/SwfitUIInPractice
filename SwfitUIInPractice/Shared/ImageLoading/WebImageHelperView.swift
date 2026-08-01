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
        WebImage(url: URL(string: urlString))
            .resizable()
            .indicator(.activity)
            .aspectRatio(contentMode: contentMode)
    }
}

#Preview {
    WebImageHelperView(urlString: "https://picsum.photos/600/600")
        .clipShape(.rect(cornerRadius: 30))
        .padding()
}
