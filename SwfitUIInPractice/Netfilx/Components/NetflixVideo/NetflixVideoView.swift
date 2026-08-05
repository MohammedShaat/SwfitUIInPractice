//
//  NetflixPlaybackView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/5/26.
//

import SwiftUI

struct NetflixVideoView: View {
    let imageUrlString: String
    let progress: Double
    
    var body: some View {
        ZStack {
            ImageLoaderView(urlString: imageUrlString)
            
            ZStack {
                Rectangle()
                    .frame(height: 4)
                    .foregroundStyle(.netflixLightGray)
                
                Rectangle()
                    .foregroundStyle(.netflixRed)
                    .containerRelativeFrame(.horizontal, alignment: .leading) { width, _ in
                        width * progress
                    }
                    .frame(height: 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom)
        }
    }
}

#Preview {
    ZStack {
        
    }
    .sheet(item: .constant(true)) { _ in
        VStack {
            NetflixVideoView(imageUrlString: sampleProducts[0].thumbnail, progress: 0.7)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(.purple.opacity(0.3))
            Spacer()
        }
    }
    .netflixTheme()
}
