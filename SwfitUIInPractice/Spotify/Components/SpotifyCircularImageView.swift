//
//  SpotifyCircularImageView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import SwiftUI

struct SpotifyCircularImageView: View {
    let imageUrlString: String
    
    var body: some View {
        ImageLoaderView(urlString: imageUrlString)
            .background(.spotifyWhite)
            .clipShape(.circle)
    }
}

#Preview {
    SpotifyCircularImageView(imageUrlString: imageUrlStr)
}
