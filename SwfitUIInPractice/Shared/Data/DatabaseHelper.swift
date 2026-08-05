//
//  DatabaseHelper.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import Foundation
import Playgrounds

struct DatabaseHelper {
    private func getData<T: Decodable>(from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func getProducts() async throws -> [Product] {
        let result: ProductsResult = try await getData(from: "https://dummyjson.com/products")
        return result.products
    }
    
    func getUsers() async throws -> [User] {
        let result: UsersResult = try await getData(from: "https://dummyjson.com/users")
        return result.users
    }
}

#Playground {
    let db = DatabaseHelper()
    do {
        _ = try await db.getProducts()
        _ = try await db.getUsers().count
    } catch {
        print(error)
    }
}
