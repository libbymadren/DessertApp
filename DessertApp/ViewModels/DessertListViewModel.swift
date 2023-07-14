//
//  DessertListViewModel.swift
//  DessertApp
//
//  Created by Libby Madren on 7/11/23.
//

import Foundation

@MainActor
class DessertListViewModel: ObservableObject {
    
    @Published var dessertList: [DessertViewModelData] = [DessertViewModelData]()
    @Published var networkError: NetworkError? = nil
    
    func populateDesserts() async {
        do {
            let dessertResponse = try await APIService().get(url: URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!) { data in
                return try? JSONDecoder().decode(DessertResponse.self, from: data)
            }
            self.dessertList = dessertResponse.meals.map(DessertViewModelData.init)
        } catch {
            networkError = error as? NetworkError
        }
        
    }
}

struct DessertViewModelData {
    private let dessert: Dessert
    
    init(_ dessert: Dessert) {
        self.dessert = dessert
    }
    
    var id: String {
        dessert.idMeal
    }
    
    var title: String {
        dessert.strMeal
    }
    
    var thumbURL: URL? {
        URL(string: dessert.strMealThumb)
    }
}
