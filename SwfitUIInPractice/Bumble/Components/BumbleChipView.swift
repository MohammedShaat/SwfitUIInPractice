//
//  BumbleChipVIew.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/3/26.
//

import SwiftUI

struct BumbleChipView<Icon: View>: View {
    let title: String
    private var image: Icon? = nil
    var backgroundColor: Color = .bumbleYellow.opacity(0.5)
    
    var body: some View {
        ZStack {
            if let image {
                Label {
                    Text(title)
                } icon: {
                    image
                }
            } else {
                Text(title)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(backgroundColor)
        .clipShape(.capsule)
    }
    
    init(title: String, image: Icon?, backgroundColor: Color = .bumbleYellow.opacity(0.5)) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.image = image
    }
}

extension BumbleChipView where Icon == EmptyView {
    init(title: String, backgroundColor: Color = .bumbleYellow.opacity(0.5)) {
        self.init(title: title, image: nil, backgroundColor: backgroundColor)
    }
}

#Preview {
    VStack {
        BumbleChipView(title: "Graduate degree", image: Image(systemName: "graduationcap"))
        BumbleChipView(title: "Music", image: Image(systemName: "headphones"))
        
        BumbleChipView(title: "📚 Reading")
        BumbleChipView(title: "🚴‍♀️ Ciclying")
    }
        .bumbleTheme()
}
