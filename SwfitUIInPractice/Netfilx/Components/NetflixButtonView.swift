//
//  NetflixButtonView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/5/26.
//

import SwiftUI

struct NetflixButtonView: View {
    let title: String
    let systemName: String
    var foregroundColor: Color = .netflixWhite
    var backgroundColor: Color = .netflixDarkGray
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button {
            action?()
        } label: {
            Label(title, systemImage: systemName)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .foregroundStyle(foregroundColor)
                .background(backgroundColor)
                .clipShape(.rect(cornerRadius: 5))
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        NetflixButtonView(title: "Play", systemName: "play.fill")
        
        NetflixButtonView(title: "Pause", systemName: "pause.fill")
    }
    .frame(width: 300)
    .font(.largeTitle)
//        .netflixTheme()
}
