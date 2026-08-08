//
//  ContentView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Spotify", image: "spotify") {
                SpotifyHomeView()
            }
            
            Tab("Bumble", image: "bumble") {
                BumbleHomeView()
            }
            
            Tab("Netflix", image: "netflix") {
                NetflixHomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
