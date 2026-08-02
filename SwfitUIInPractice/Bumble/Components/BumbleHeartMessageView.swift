//
//  BumbleHeartMessageView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/3/26.
//

import SwiftUI

struct BumbleHeartMessageView: View {
    var bubbleSize: CGFloat = 20
    
    var body: some View {
        ZStack {
            Image(systemName: "bubble.fill")
                .font(.system(size: bubbleSize))
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.bumbleYellow)
                .font(.system(size: bubbleSize / 2))
                .offset(y: -(bubbleSize / 10))
        }
    }
}

#Preview {
    BumbleHeartMessageView(bubbleSize: 50)
}
