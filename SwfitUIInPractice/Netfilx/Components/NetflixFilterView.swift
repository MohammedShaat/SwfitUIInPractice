//
//  NetflixFilterView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/4/26.
//

import SwiftUI
import SwiftfulUI

struct NetflixFilterView: View {
    let options: [String]
    @Binding var selected: String?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                if selected != nil {
                    Image(systemName: "xmark.circle")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .foregroundStyle(.netflixLightGray)
                        .asButton(.press) {
                            selected = nil
                        }
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .leading),
                                removal: .move(edge: .leading).combined(with: .opacity)
                            )
                        )
                }
                
                ForEach(options, id: \.self) { option in
                    if selected == nil || selected == option {
                        NetflixStrokedChipView(
                            title: option,
                            isSelected: selected == option
                        )
                        .asButton(.press) {
                            selected = option
                        }
                    }
                }
            }
            .padding()
        }
        .animation(.spring(duration: 0.5, bounce: 0.3), value: selected)
    }
}

#Preview {
    @State @Previewable var selected: String? = nil
    let options = ["TV Shows", "Movies", "Categories"]
    
    NetflixFilterView(options: options, selected: $selected)
        .netflixTheme()
}
