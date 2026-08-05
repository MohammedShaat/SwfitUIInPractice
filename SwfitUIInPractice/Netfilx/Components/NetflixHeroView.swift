//
//  NetflixHeroView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/5/26.
//

import SwiftUI
import SwiftfulUI

struct NetflixHeroView: View {
    let imageUrlString: String
    let title: String
    let category: String
    let brand: String
    var onPlayCLick: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageUrlString)
                .background(.netflixLightGray.opacity(0.2))
            
            VStack(spacing: 20) {
                infoSection
                
                buttonsSection
                
            }
            .foregroundStyle(.netflixWhite)
            .frame(maxWidth: .infinity)
            .padding()
            .padding(.bottom)
            .background(
                LinearGradient(colors: [.netflixWhite.opacity(0), .netflixBlack.opacity(0.6)], startPoint: .top, endPoint: .bottom)
            )
        }
        .frame(maxWidth: .infinity)
        .clipShape(.rect(cornerRadius: 10))
    }
    
    private var infoSection: some View {
        Group {
            HStack {
                Text("N")
                    .foregroundStyle(.netflixRed)
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("FILM")
                    .foregroundStyle(.netflixBlack)
                    .font(.subheadline)
                    .kerning(3)
            }
            
            Text(title)
                .lineLimit(3)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 16) {
                Text(category.capitalized)
                
                Image(systemName: "circle.fill")
                    .font(.system(size: 5))
               
                Text(brand)
            }
        }
    }
    
    private var buttonsSection: some View {
        HStack(spacing: 20) {
            NetflixButtonView(title: "Play", systemName: "play.fill", foregroundColor: .netflixDarkGray, backgroundColor: .netflixWhite, action: onPlayCLick) 
            
            NetflixButtonView(title: "My List", systemName: "plus")
        }
        .padding(.horizontal)
    }
}

#Preview {
    let product = sampleProducts[0]
    
    NetflixHeroView(
        imageUrlString: product.thumbnail,
        title: product.title,
        category: product.category,
        brand: product.brand ?? ""
    )
        .frame(height: 600)
        .padding()
        .netflixTheme()
}
