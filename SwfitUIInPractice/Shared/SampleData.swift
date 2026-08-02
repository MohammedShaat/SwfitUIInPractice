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
//            "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp",
            "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTYUucytKnoWiHD62bM5QQw4Mr9v3EtPdCkw5GHJbu1S_aHkK1VcuvAPSYK6ga-E69pYcCVZSijhBQZlk3eN2pq6o-YXe1qXIL1zqaemoC4zkjff3DMbC7j6HTWzKBpG4zYM4QjLYc-&usqp=CAc",
            "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTpRK6zGejMcI_5aTv3D5hVhHItF3BrD-lt31ljZaTRFmTsHxtY1miVrd6AT107mtQq-3NB1QiujfJVvVxrBKP4fzRWFylsfOeKFRgI-NBVieGi0EWcn2lNzHRTOXu2rvzN0kpcjQ&usqp=CAc",
            "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQwh_Vu06Vr9ePbsiASWI3fxvpdoZYbTrBeeEH4L6gJf13ry5FLI_DZAlnQaOtRgMbmpJFtUCE8liFj_HpglknkVX_BULFceHB-q2FRkjtts7_mKilu9iuWu78fVS-lYCshw9uRPg&usqp=CAc",
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

let sampleUser = User(
    id: 1,
    firstName: "Olivia",
    lastName: "John",
    age: 31,
    email: "olivia@gmail.com",
    username: "olivia",
    password: "123123",
    phone: "+125841269841",
    image: "https://picsum.photos/600",
    height: 180.25,
    weight: 70.8
)
