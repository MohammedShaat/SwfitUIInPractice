//
//  Product.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import Foundation

struct ProductsResult: Codable {
    let products: [Product]
}

struct Product: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String?
    let category: String
    let thumbnail: String
    let images: [String]
    let tags: [String]
    
    var recentlyAdded: Bool {
//        .random()
        false
    }
    var watchingProgress: Double {
        .random(in: 0...1)
    }
    var isNew: Bool {
        .random()
    }
    var year: Int {
        .random(in: 2018...2026)
    }
    var seasons: Int {
        .random(in: 1...4)
    }
    var isTop: Bool {
//        .random()
        true
    }
    var topRating: Int {
        isTop ? .random(in: 1...10) : 0
    }
    var cast: [String] {
        ["John Stathim", "Jack Ryan", "Will"]
    }
}

struct CategorizedProducts: Hashable, Identifiable {
    let id = UUID().uuidString
    let name: String
    let products: [Product]
}
