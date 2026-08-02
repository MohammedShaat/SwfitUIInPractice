//
//  BumbleFilterVIew.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/2/26.
//

import SwiftUI
import SwiftfulUI

struct BumbleFilterVIew: View {
    let options: [String]
    @Binding var selected: String
    
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment: .top) {
            ForEach(options, id: \.self) { option in
                let isSelected = selected == option
                
                VStack(spacing: 16) {
                    Text(option)
                        .foregroundStyle(isSelected ? .bumbleBlack : .bumbleGray)
                        .fontWeight(isSelected ? .bold : .regular)
                    
                    if isSelected {
                        Rectangle()
                            .fill(.bumbleBlack)
                            .frame(height: 2)
                            .frame(maxWidth: .infinity)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(.purple.opacity(0.001))
                .asButton(.press) {
                    selected = option
                }
            }
        }
        .foregroundStyle(.bumbleGray)
        .font(.headline)
    }
}

#Preview {
    @State @Previewable var selected = "Everyone"
    let options = ["Everyone", "Trending", "Top"]
    
    BumbleFilterVIew(options: options, selected: $selected)
}
