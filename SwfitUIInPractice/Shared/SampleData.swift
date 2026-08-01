//
//  SampleData.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import Foundation

let imageUrlStr = "https://picsum.photos/200"

let sampleProducts: [Product] = [
    Product(
        id: 1,
        title: "Essence Mascara Lash Princess",
        description: "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
        price: 9.99,
        discountPercentage: 10.48,
        rating: 2.56,
        stock: 99,
        brand: "Essence",
        category: "beauty",
        thumbnail: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",
        images: [
            "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp"
        ]
    ),
    Product(
        id: 2,
        title: "Eyeshadow Palette with Mirror",
        description: "The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it's convenient for on-the-go makeup application.",
        price: 19.99,
        discountPercentage: 18.19,
        rating: 2.86,
        stock: 34,
        brand: "Glamour Beauty",
        category: "beauty",
        thumbnail: "https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/thumbnail.webp",
        images: [
            "https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/1.webp"
        ]
    ),
    Product(
        id: 3,
        title: "Powder Canister",
        description: "The Powder Canister is a finely milled setting powder designed to set makeup and control shine. With a lightweight and translucent formula, it provides a smooth and matte finish.",
        price: 14.99,
        discountPercentage: 9.84,
        rating: 4.64,
        stock: 89,
        brand: "Velvet Touch",
        category: "beauty",
        thumbnail: "https://cdn.dummyjson.com/product-images/beauty/powder-canister/thumbnail.webp",
        images: [
            "https://cdn.dummyjson.com/product-images/beauty/powder-canister/1.webp"
        ]
    )
]
