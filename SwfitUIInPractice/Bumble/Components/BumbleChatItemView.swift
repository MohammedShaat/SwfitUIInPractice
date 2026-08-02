//
//  BumbleChatItemView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/4/26.
//

import SwiftUI

struct BumbleChatItemView: View {
    let imageUrlString: String
    let name: String
    let lastMessage: String
    let storyProgress: Double
    let hasReplied: Bool
    let isActive: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            BumbleCircleProgressView(imageUrlString: imageUrlString, strokeEnd: storyProgress, isActive: isActive)
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(name)
                        .foregroundStyle(.bumbleBlack)
                        .font(.title3.bold())
                    
                    Spacer()
                    
                    if !hasReplied {
                        BumbleChipView(title: "Your move".uppercased(), backgroundColor: .bumbleYellow)
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                }
                
                Text(lastMessage)
                    .foregroundStyle(.bumbleGray)
            }
            .lineLimit(1)
        }
    }
}

#Preview {
    let user = sampleUser
    
    VStack {
        BumbleChatItemView(
            imageUrlString: user.image,
            name: user.firstName,
            lastMessage: user.lastMessage,
            storyProgress: user.storyProgress,
            hasReplied: true,
            isActive: true
        )
        
        BumbleChatItemView(
            imageUrlString: user.image,
            name: user.firstName,
            lastMessage: user.lastMessage,
            storyProgress: user.storyProgress,
            hasReplied: false,
            isActive: false
        )
    }
    .padding()
}
