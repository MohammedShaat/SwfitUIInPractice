//
//  SpotifyDetailView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/2/26.
//

import SwiftfulUI
import SwiftUI

struct SpotifyPlaylistDetailView: View {
    let description: String
    let brand: String
    let username: String
    let category: String
    
    var onAddClicked: (() -> Void)? = nil
    var onDownloadClicked: (() -> Void)? = nil
    var onShareClicked: (() -> Void)? = nil
    var onMoreClicked: (() -> Void)? = nil
    var onShuffleClicked: (() -> Void)? = nil
    var onPlayClicked: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(description)
            
            
            HStack(spacing: 0) {
                Label {
                    Text("Made for ")
                } icon: {
                    Image(systemName: "applelogo")
                        .foregroundStyle(.spotifyGreen)
                }
                
                Text(username)
                    .fontWeight(.bold)
                    .foregroundStyle(.spotifyWhite)
            }
            .font(.headline)
            .foregroundStyle(.spotifyLightGray)
            
            Text(category.capitalized)
            
            
            
            HStack(spacing: 0) {
                Group {
                    Image(systemName: "plus.circle")
                        .padding(8)
                        .onTapGesture {
                            onAddClicked?()
                        }
                    Image(systemName: "arrow.down.circle")
                        .padding(8)
                        .onTapGesture {
                            onDownloadClicked?()
                        }
                    Image(systemName: "square.and.arrow.up")
                        .padding(8)
                        .onTapGesture {
                            onShareClicked?()
                        }
                    Image(systemName: "ellipsis")
                        .padding(8)
                        .onTapGesture {
                            onMoreClicked?()
                        }
                }
                .foregroundStyle(.spotifyWhite)
                .font(.title2)
                .offset(x: -8)
                
                Spacer()
                
                Group {
                    Image(systemName: "shuffle")
                        .padding(8)
                        .onTapGesture {
                            onShuffleClicked?()
                        }
                    Image(systemName: "play.circle.fill")
                        .padding(8)
                        .onTapGesture {
                            onPlayClicked?()
                        }
                }
                .foregroundStyle(.spotifyGreen)
                .font(.largeTitle)
            }
            .padding(.vertical)
        }
        .foregroundStyle(.spotifyLightGray)
        .padding()
    }
}

#Preview {
    let product = sampleProducts[0]
    
    SpotifyPlaylistDetailView(description: product.description, brand: product.brand ?? "", username: "Terry", category: product.category)
        .spotifyPreview()
}
