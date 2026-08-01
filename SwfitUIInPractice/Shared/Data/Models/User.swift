//
//  User.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/1/26.
//

import Foundation

struct UsersResult: Codable {
    let users: [User]
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let email: String
    let username: String
    let password: String
    let phone: String
    let image: String
    let height: Double
    let weight: Double
}
