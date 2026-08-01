//
//  ImageLoaderView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import SwiftUI

struct ImageLoaderView: View {
    let urlString: String
    var contentMode: ContentMode = .fit
    
    var body: some View {
        WebImageHelperView(urlString: urlString, contentMode: contentMode)
    }
}

#Preview {
    ImageLoaderView(urlString: "https://picsum.photos/600/600")
}
