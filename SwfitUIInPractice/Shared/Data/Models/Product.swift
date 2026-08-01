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
}

struct CategorizedProducts: Hashable, Identifiable {
    let id = UUID().uuidString
    let name: String
    let products: [Product]
}
