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
    
    var study: String {
        "Graduate Degree"
    }
    var work: String {
        "Work at Some Job"
    }
    var bio: String {
        "Hello, my name is Olivia. I'm 31 years old, and I work at Some Job."
    }
    var images: [String] {
        [
            "https://picsum.photos/600/600",
            "https://picsum.photos/601",
            "https://picsum.photos/601/601",
        ]
    }
    var distance: Int {
        10
    }
    var address: String {
        "New York, NY"
    }
    var countryFlag: String {
        "🇺🇸"
    }
    var basics: [UserInterests] {
        [
            UserInterests(name: String(height), iconName: "ruler"),
            UserInterests(name: study,iconName: "graduationcap"),
            UserInterests(name: "Socially", iconName: "wineglass"),
            UserInterests(name: "Virgo", iconName: "moon.stars.fill"),
        ]
    }
    var interests: [UserInterests] {
        [
            UserInterests(name: "🏃‍♀️ Running"),
            UserInterests(name: "📚 Reading"),
            UserInterests(name: "🥘 Cooking"),
        ]
    }
    var isActive: Bool {
        .random()
    }
    var storyProgress: Double {
        .random(in: 0...1)
    }
    var lastMessage: String {
        "Have you watch the WWDC? They've released new features to Swift"
    }
    var replied: Bool {
        .random()
    }
}

struct UserInterests: Codable, Identifiable {
    var id = UUID().uuidString
    let name: String
    var iconName: String? = nil
    var emoji: String? = nil
}
