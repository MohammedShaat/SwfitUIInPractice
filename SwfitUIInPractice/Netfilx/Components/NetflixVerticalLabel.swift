//
//  NetflixVerticalLabel.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/6/26.
//

import SwiftUI
import SwiftfulUI

struct NetflixVerticalLabel: View {
    let title: String
    let systemName: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: systemName)
            Text(title)
                .font(.caption)
                .fontWeight(.regular)
        }
    }
}

#Preview {
    NetflixVerticalLabel(title: "My List", systemName: "plus")
}
