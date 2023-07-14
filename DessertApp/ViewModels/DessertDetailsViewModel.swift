//
//  DessertDetailsViewModel.swift
//  DessertApp
//
//  Created by Libby Madren on 7/12/23.
//

import Foundation

@MainActor
class DessertDetailsViewModel: ObservableObject {
    
    @Published var dessertDetails: DessertDetailsViewModelData?
    
    func populateDessertDetails(id: String) async {
        do {
            let dessertDetailsResponse = try await APIService().get(url: URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!) { data in
                return try? JSONDecoder().decode(DessertDetailsResponse.self, from: data)
            }
            self.dessertDetails = DessertDetailsViewModelData(dessertDetailsResponse.meals[0])
        } catch {
            print(error)
        }
        
    }
}

struct DessertDetailsViewModelData {
    private let dessertDetails: DessertDetails
    
    init(_ dessertDetails: DessertDetails) {
        self.dessertDetails = dessertDetails
    }
    
    var id: String {
        dessertDetails.idMeal ?? ""
    }
    
    var title: String {
        dessertDetails.strMeal ?? ""
    }
    
    var drinkAlternate: String? {
        dessertDetails.strDrinkAlternate
    }
    
    var category: String? {
        dessertDetails.strCategory
    }
    
    var area: String? {
        dessertDetails.strArea
    }
    
    var instructions: [String] {
        dessertDetails.strInstructions?.replacingOccurrences(of: "\r\n\r\n", with: "\r\n")
            .components(separatedBy: "\r\n") ?? []
    }
    
    var thumbURL: URL? {
        URL(string: dessertDetails.strMealThumb ?? "")
    }
    
    var tags: String? {
        dessertDetails.strTags
    }
    
    var youtubeURL: URL? {
        URL(string: dessertDetails.strYoutube ?? "")
    }
    
    var ingredient1: String {
        dessertDetails.strIngredient1 ?? ""
    }
    
    var ingredient2: String {
        dessertDetails.strIngredient2 ?? ""
    }
    
    var ingredient3: String {
        dessertDetails.strIngredient3 ?? ""
    }
    
    var ingredient4: String {
        dessertDetails.strIngredient4 ?? ""
    }
    
    var ingredient5: String {
        dessertDetails.strIngredient5 ?? ""
    }
    
    var ingredient6: String {
        dessertDetails.strIngredient6 ?? ""
    }
    
    var ingredient7: String {
        dessertDetails.strIngredient7 ?? ""
    }
    
    var ingredient8: String {
        dessertDetails.strIngredient8 ?? ""
    }
    
    var ingredient9: String {
        dessertDetails.strIngredient9 ?? ""
    }
    
    var ingredient10: String {
        dessertDetails.strIngredient10 ?? ""
    }
    
    var ingredient11: String {
        dessertDetails.strIngredient11 ?? ""
    }
    
    var ingredient12: String {
        dessertDetails.strIngredient12 ?? ""
    }
    
    var ingredient13: String {
        dessertDetails.strIngredient13 ?? ""
    }
    
    var ingredient14: String {
        dessertDetails.strIngredient14 ?? ""
    }
    
    var ingredient15: String {
        dessertDetails.strIngredient15 ?? ""
    }
    
    var ingredient16: String {
        dessertDetails.strIngredient16 ?? ""
    }
    
    var ingredient17: String {
        dessertDetails.strIngredient17 ?? ""
    }
    
    var ingredient18: String {
        dessertDetails.strIngredient18 ?? ""
    }
    
    var ingredient19: String {
        dessertDetails.strIngredient19 ?? ""
    }
    
    var ingredient20: String {
        dessertDetails.strIngredient20 ?? ""
    }
    
    var measure1: String {
        dessertDetails.strMeasure1 ?? ""
    }
    
    var measure2: String {
        dessertDetails.strMeasure2 ?? ""
    }
    
    var measure3: String {
        dessertDetails.strMeasure3 ?? ""
    }
    
    var measure4: String {
        dessertDetails.strMeasure4 ?? ""
    }
    
    var measure5: String {
        dessertDetails.strMeasure5 ?? ""
    }
    
    var measure6: String {
        dessertDetails.strMeasure6 ?? ""
    }
    
    var measure7: String {
        dessertDetails.strMeasure7 ?? ""
    }
    
    var measure8: String {
        dessertDetails.strMeasure8 ?? ""
    }
    
    var measure9: String {
        dessertDetails.strMeasure9 ?? ""
    }
    
    var measure10: String {
        dessertDetails.strMeasure10 ?? ""
    }
    
    var measure11: String {
        dessertDetails.strMeasure11 ?? ""
    }
    
    var measure12: String {
        dessertDetails.strMeasure12 ?? ""
    }
    
    var measure13: String {
        dessertDetails.strMeasure13 ?? ""
    }
    
    var measure14: String {
        dessertDetails.strMeasure14 ?? ""
    }
    
    var measure15: String {
        dessertDetails.strMeasure15 ?? ""
    }
    
    var measure16: String {
        dessertDetails.strMeasure16 ?? ""
    }
    
    var measure17: String {
        dessertDetails.strMeasure17 ?? ""
    }
    
    var measure18: String {
        dessertDetails.strMeasure18 ?? ""
    }
    
    var measure19: String {
        dessertDetails.strMeasure19 ?? ""
    }
    
    var measure20: String {
        dessertDetails.strMeasure20 ?? ""
    }
    
    var ingredients: [String] {
        [
            self.ingredient1,
            self.ingredient2,
            self.ingredient3,
            self.ingredient4,
            self.ingredient5,
            self.ingredient6,
            self.ingredient7,
            self.ingredient8,
            self.ingredient9,
            self.ingredient10,
            self.ingredient11,
            self.ingredient12,
            self.ingredient13,
            self.ingredient14,
            self.ingredient15,
            self.ingredient16,
            self.ingredient17,
            self.ingredient18,
            self.ingredient19,
            self.ingredient20,
        ].filter({$0 != ""})
    }
    
    var measurements: [String] {
        [
            self.measure1,
            self.measure2,
            self.measure3,
            self.measure4,
            self.measure5,
            self.measure6,
            self.measure7,
            self.measure8,
            self.measure9,
            self.measure10,
            self.measure11,
            self.measure12,
            self.measure13,
            self.measure14,
            self.measure15,
            self.measure16,
            self.measure17,
            self.measure18,
            self.measure19,
            self.measure20,
        ].filter({$0 != ""})
    }
}
