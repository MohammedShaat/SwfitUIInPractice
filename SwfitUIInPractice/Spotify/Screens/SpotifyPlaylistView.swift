//
//  SpotifyPlaylistView 2.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/2/26.
//


import SwiftfulUI
import SwiftUI


struct SpotifyPlaylistView: View {
    let product: Product
    let username: String
    
    @State private var similarProducts: [Product] = []
    @State private var showingNavTitle = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.spotifyBlack
                .ignoresSafeArea()
            
            ScrollView {
                LazyVStack {
                    header
                        .asStretchyHeader(startingHeight: 300)
                        .background(
                            GeometryReader(content: { proxy in
                                let yOffset = proxy.frame(in: .global).maxY
                                
                                Color.clear
                                    .onChange(of: yOffset) {
                                        print(yOffset)
                                        showingNavTitle = yOffset < 140 ? true : false
                                    }
                            })
                        )
                    
                    SpotifyPlaylistDetailView(
                        description: product.description,
                        brand: product.brand ?? "",
                        username: username,
                        category: product.category
                    )
                    
                    similarSection
                }
            }
            .ignoresSafeArea(edges: .top)
            
            SpotifyNavigationBarView(title: product.title, showingTitle: showingNavTitle) {
                dismiss()
            }
                .animation(.smooth(duration: 0.25), value: showingNavTitle)
        }
        .task {
            await getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            let db = DatabaseHelper()
            
            similarProducts = try await db.getProducts().filter { $0.category == product.category }
        } catch {
            print("Failed to get data:\n", error)
        }
    }
    
    private var header: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: product.thumbnail)
                .background(.spotifyWhite)
            
            VStack(alignment: .leading) {
                Text(product.brand ?? "")
                
                Text(product.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .foregroundStyle(.spotifyBlack)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                LinearGradient(colors: [.spotifyWhite.opacity(0), .spotifyWhite], startPoint: .top, endPoint: .bottom)
            )
        }
    }
    
    private var similarSection: some View {
        ForEach(similarProducts) { product in
            NavigationLink(value: product) {
                SpotifyPlaylistSimilarView(
                    imageUrlString: product.thumbnail,
                    title: product.title,
                    category: product.category
                )
                .padding(.leading)
            }
        }
    }
}

#Preview {
    SpotifyPlaylistView(product: sampleProducts[0], username: "Mohammed")
}
