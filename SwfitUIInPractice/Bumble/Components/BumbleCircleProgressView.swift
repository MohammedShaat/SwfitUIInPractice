//
//  BumbleCircleImageView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/4/26.
//

import SwiftUI
import SwiftfulUI

struct BumbleCircleProgressView: View {
    let imageUrlString: String
    let strokeEnd: Double
    let isActive: Bool
    
    @State private var containerWidth: Double = 0
    
    var body: some View {
        ZStack {
            // Image
            ImageLoaderView(urlString: imageUrlString)
                .clipShape(.circle)
                .padding(containerWidth * 0.04)
            
            // Path stroke
            Circle()
                .stroke(.bumbleGray, lineWidth: containerWidth * 0.03)
            
            // Progress stroke
            Circle()
                .trim(from: 0, to: strokeEnd)
                .stroke(.bumbleYellow, style: .init(lineWidth: containerWidth * 0.06, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .scaleEffect(x: -1)
            
            // Active status
            if isActive {
                Circle()
                    .fill(.white)
                    .frame(width: containerWidth * 0.25)
                    .overlay(
                        Circle()
                            .fill(.yellow)
                            .padding(containerWidth * 0.04)
                    )
                    .frame(width: containerWidth, height: containerWidth, alignment: .bottomTrailing)
            }
        }
        .readingFrame { frame in
            containerWidth = frame.width
        }
    }
}

#Preview {
    BumbleCircleProgressView(imageUrlString: sampleUser.image, strokeEnd: 0.75, isActive: true)
//        .frame(width: 200, height: 200)
        .padding()
}
