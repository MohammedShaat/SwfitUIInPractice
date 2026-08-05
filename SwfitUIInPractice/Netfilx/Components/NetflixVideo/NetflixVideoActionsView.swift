//
//  NetflixVideoActionsView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/6/26.
//

import SwiftUI
import SwiftfulUI

struct NetflixVideoActionsView: View {
    @Binding var showCheckMark: Bool
    @Binding var showRatePopover: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            Group {
                myList
                
                reaction
                
                share
                
            }
            .frame(maxWidth: .infinity)
        }
        .font(.title)
        .fontWeight(.medium)
        .padding()
        
    }
    
    private var myList: some View {
        VStack(spacing: 8) {
            if showCheckMark {
                Image(systemName: "checkmark")
                    .transition(.rotate)
            } else {
                Image(systemName: "plus")
                    .transition(.rotateClockwise)
            }
            
            Text("My List")
                .font(.caption)
                .fontWeight(.regular)
        }
        .asButton(.press) {
            withAnimation(.spring(bounce: 0.4)) {
                showCheckMark.toggle()
            }
        }
    }
    
    private var reaction: some View {
        NetflixVerticalLabel(title: "Rate", systemName: "hand.thumbsup")
            .asButton(.press){
                showRatePopover.toggle()
            }
            .popover(isPresented: $showRatePopover) {
                ZStack {
                    Color.netflixDarkGray.ignoresSafeArea()
                    
                    HStack(spacing: 20) {
                        NetflixVerticalLabel(title: "Not fore me", systemName: "hand.thumbsdown")
                        .asButton(.press) {
                            showRatePopover.toggle()
                        }
                        
                        NetflixVerticalLabel(title: "I like this", systemName: "hand.thumbsup")
                        .asButton(.press) {
                            showRatePopover.toggle()
                        }
                        
                        NetflixVerticalLabel(title: "Love this!", systemName: "bolt.heart")
                        .asButton(.press) {
                            showRatePopover.toggle()
                        }
                    }
                    .font(.title2)
                    .padding()
                    .presentationCompactAdaptation(.popover)
                }
            }
    }
    
    private var share: some View {
        ShareLink(item: URL(string: "https://github.com/MohammedShaat")!) {
            NetflixVerticalLabel(title: "Share", systemName: "paperplane")
        }
    }
}

#Preview {
    @State @Previewable var showCheckMark: Bool = false
    @State @Previewable var showRatePopover: Bool = false
    
    NetflixVideoActionsView(showCheckMark: $showCheckMark, showRatePopover: $showRatePopover)
}
