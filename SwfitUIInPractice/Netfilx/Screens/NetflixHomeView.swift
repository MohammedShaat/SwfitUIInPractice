//
//  NetflixHomeView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/4/26.
//

import SwiftUI
import SwiftfulUI

struct NetflixHomeView: View {
    private let filterOptions = ["TV Shows", "Movies", "Categories"]
    @State private var selected: String? = nil
    @State private var products: [Product] = []
    @State private var hero: Product?
    @State private var tagsProducts: [CategorizedProducts] = []
    
    @State private var containerSize: CGSize = .zero
    @State private var headerHeight: Double = 0
    @State private var scrollOffset: Double = 0
    @State private var showFilter = true
    
    @State private var selectedProduct: Product?
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            
            animatedBackground
            
            contentSection
            
            headerAndFilterSection
        }
        .task {
            await getData()
        }
        .readingFrame { frame in
            if containerSize == .zero {
                containerSize = frame.size
            }
        }
        .sheet(item: $selectedProduct) { product in
            NetflixDetailView(product: product)
        }
    }
    
    private func getData() async {
        do {
            let db = DatabaseHelper()
            products = try await db.getProducts()
            
            hero = products.randomElement()
            
            let tags = Set(products.flatMap {$0.tags})
            tagsProducts = tags.map { tag in
                let filterdProducts = products.filter { $0.tags.contains(tag) }
                return CategorizedProducts(name: tag, products: filterdProducts)
            }
            tagsProducts.sort { $0.products.count > $1.products.count }
        } catch {
            print("Failed to get data:\n", error)
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .font(.largeTitle)
            
            Spacer()
            
            Group {
                Image(systemName: "tv.badge.wifi")
                Image(systemName: "magnifyingglass")
            }
            .font(.title3)
            .padding(8)
            .background(.green.opacity(0.001))
        }
        .foregroundStyle(.netflixWhite)
        .padding(.horizontal)
        .background(
            ZStack {
                if !showFilter {
                    Rectangle()
                        .fill(.clear)
                        .background(.ultraThinMaterial)
                        .brightness(-0.2)
                }
            }
        )
    }
    
    private var headerAndFilterSection: some View {
        // Header and filter
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                header
                
                NetflixFilterView(options: filterOptions, selected: $selected)
                    .opacity(showFilter ? 1 : 0)
                    .offset(y: showFilter ? 0 : -30)
            }
            .animation(.smooth, value: showFilter)
            .readingFrame { frame in
                if headerHeight == .zero {
                    headerHeight = frame.height
                }
            }
            
            Spacer()
        }
    }
    
    private var animatedBackground: some View {
        VStack {
            let midHeight = containerSize.height / 2.5
            
            LinearGradient(colors: [.netflixDarkRed, .netflixBlack], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .frame(maxHeight: max(midHeight + min(scrollOffset, 0), 0))
                .opacity((midHeight + scrollOffset) > midHeight / 1.3 ? 1 : 0)
                .animation(.smooth, value: scrollOffset)
            
            Spacer()
        }
    }
    
    private var contentSection: some View {
        ScrollView {
            LazyVStack {
                if let hero {
                    NetflixHeroView(
                        imageUrlString: hero.thumbnail,
                        title: hero.title,
                        category: hero.category,
                        brand: hero.brand ?? "",
                        onPlayCLick:  {
                            print("Hero")
                            selectedProduct = hero
                        }
                    )
                    .containerRelativeFrame(.vertical) { height, _ in height * 0.8 }
                    .padding()
                    .readingFrame { frame in
                        showFilter = (frame.minY - headerHeight) > 0
                    }
                }
                
                ForEach(tagsProducts.enumerated(), id: \.element.id) { (index, collection) in
                    NetflixListView(
                        title: collection.name,
                        prodcuts: collection.products,
                        isIndexed: index == 1
                    ) { product in
                        selectedProduct = product
                    }
                    
                    .padding(.vertical)
                }
            }
            .padding(.top, headerHeight)
            .readingFrame { frame in
                scrollOffset = frame.minY
            }
        }
    }
}
#Preview {
    NetflixHomeView()
}
