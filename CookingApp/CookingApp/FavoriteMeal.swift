//
//  FavoriteMeal.swift
//  CookingApp
//
//  Created by Zhanel Amanzhol on 17.12.2025.
//


import Foundation

struct FavoriteMeal: Codable, Equatable {
    let id: String
    let title: String
    let thumb: String?

    static func == (lhs: FavoriteMeal, rhs: FavoriteMeal) -> Bool {
        lhs.id == rhs.id
    }
}
