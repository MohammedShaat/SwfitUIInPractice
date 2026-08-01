//
//  SpotiyfHomeView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import SwiftUI

struct SpotifyHomeView: View {
    @State private var selectedCategory: SpotifyCategory = .all
    @State private var user: User?
    
    @State private var recent: [Product] = []
    @State private var highlight: Product?
    @State private var categorizedProducts: [CategorizedProducts] = []
    
    @State private var path: [Product] = []
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.spotifyBlack
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(pinnedViews: .sectionHeaders) {
                        Section {
                            VStack {
                                recentsSection
                                
                                newReleaseSection
                                
                                categoryLists(categorizedProducts: categorizedProducts)
                            }
                        } header: {
                            header
                                .background(.spotifyBlack)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                GeometryReader { proxy in
                    Color.spotifyBlack
                        .frame(height: proxy.safeAreaInsets.top)
                        .ignoresSafeArea()
                }
            }
            .task {
                await getData()
            }
            .navigationDestination(for: Product.self) { product in
                SpotifyPlaylistView(product: product,username: user?.firstName ?? "")
            }
        }
    }
    
    private func getData() async {
        do {
            let db = DatabaseHelper()
            user = try await db.getUsers().randomElement()
            
            let products = try await db.getProducts()
            recent = Array(products.prefix(8))
            
            highlight = products.randomElement()
            
            let categories = Set(products.map { $0.category })
            categorizedProducts = categories.map { category in
                CategorizedProducts(
                    name: category,
                    products: products.filter { $0.category == category
                    })
            }
        } catch {
            print("Failed to get data:\n", error)
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let user {
                    SpotifyCircularImageView(imageUrlString: user.image)
                }
            }
            .frame(width: 40, height: 40)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(SpotifyCategory.allCases, id: \.self) { category in
                        SpotifyChipView(
                            title: category.rawValue.capitalized,
                            isSelected: selectedCategory == category
                        ) {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
        .padding()
        
    }
    
    private var recentsSection: some View {
        LazyVGrid(columns: columns) {
            ForEach(recent) { product in
                NavigationLink(value: product) {
                    SpotifyRecentItemView(imageUrlStr: product.thumbnail, title: product.title)
                }
            }
        }
        .padding()
    }
    
    private var newReleaseSection: some View {
        Group {
            if let highlight {
                SpotifyHighlightView(
                    imageUrlString: highlight.thumbnail,
                    brand: highlight.brand ?? "Apple",
                    category: highlight.category,
                    title: highlight.title,
                    description: highlight.description
                ) {
                    
                } onPlayClicked: {
                    path.append(highlight)
                }
                .padding()
            }
        }
    }
    
    private func categoryLists(categorizedProducts: [CategorizedProducts]) -> some View {
        ForEach(categorizedProducts) { category in
            VStack(alignment: .leading) {
                Text(category.name)
                    .font(.title)
                    .foregroundStyle(.spotifyWhite)
                    .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top) {
                        ForEach(category.products) { product in
                            NavigationLink(value: product) {
                                SpotifyCategoryItemVIew(imageUrlString: product.thumbnail, title: product.title)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    SpotifyHomeView()
}
