//
//  NetflixDetailView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/5/26.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailView: View {
    let product: Product
    var onBroadcastingClicked: (() -> Void)? = nil
    var onCancelClicked: (() -> Void)? = nil
    
    @State private var similarProducts: [Product] = []
    @State private var selectedProduct: Product?
    
    @State private var showRatePopover: Bool = false
    @State private var showCheckMark: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            header
            
            VStack(spacing: 0) {
                NetflixVideoView(imageUrlString: product.thumbnail, progress: product.watchingProgress)
                    .containerRelativeFrame(.vertical) { height, _ in height * 0.3 }
                
                ScrollView {
                    LazyVStack {
                        NetflixVideoDetailView(title: product.title, isNew: product.isNew, year: product.year, seasons: product.seasons, isTop: product.isTop, topRating: product.topRating, description: product.description, cast: product.cast)
                        
                        NetflixVideoActionsView(showCheckMark: $showCheckMark, showRatePopover: $showRatePopover)
                        
                        similarProductsSection
                    }
                }
            }
        }
        .task {
            await getData()
        }
        .foregroundStyle(.netflixWhite)
        .toolbarVisibility(.hidden, for: .navigationBar)
        .sheet(item: $selectedProduct) { product in
            NetflixDetailView(product: product)
        }
    }
    
    private func getData() async {
        do {
            let db = DatabaseHelper()
            similarProducts = try await db.getProducts()
            //.filter { $0.category == product.category }
        } catch {
            print("Failed to get data:\n", error)
        }
    }
    
    private var header: some View {
        ZStack {
            HStack {
                Spacer()
                
                Image(systemName: "tv.badge.wifi")
                    .padding(10)
                    .background(.netflixLightGray.opacity(0.4))
                    .clipShape(.circle)
                    .asButton(.press) {
                        onBroadcastingClicked?()
                    }
                
                Image(systemName: "xmark")
                    .padding(13)
                    .background(.netflixLightGray.opacity(0.4))
                    .clipShape(.circle)
                    .asButton(.press) {
                        onCancelClicked?()
                        dismiss()
                    }
            }
            .padding()
            .font(.subheadline)
            .foregroundStyle(.netflixWhite)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
    
    
    private var similarProductsSection: some View {
        VStack {
            let columns = [
                GridItem(.flexible(), alignment: .top),
                GridItem(.flexible(), alignment: .top),
                GridItem(.flexible(), alignment: .top),
            ]
            
            Text("More Like This")
                .font(.headline)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns) {
                ForEach(similarProducts) { product in
                    NetflixItemVIew(imageUrlString: product.thumbnail, title: product.title, recentlyAdded: product.recentlyAdded)
                        .asButton(.press) {
                            selectedProduct = product
                        }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ZStack {
        
    }
    .sheet(item: .constant(true)) { _ in
        NetflixDetailView(product: sampleProducts[0])
    }
    .netflixTheme()
}
