//
//  Dessert.swift
//  DessertApp
//
//  Created by Libby Madren on 7/11/23.
//

import Foundation

struct DessertResponse: Decodable {
    let meals: [Dessert]
}

struct Dessert: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
