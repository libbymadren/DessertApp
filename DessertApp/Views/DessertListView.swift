//
//  DessertListView.swift
//  DessertApp
//
//  Created by Libby Madren on 7/11/23.
//

import SwiftUI

struct DessertListView: View {
    @ObservedObject private var viewModel = DessertListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.dessertList, id: \.id) { dessert in
                    NavigationLink(destination: DessertDetailsView(dessert: dessert)) {
                        DessertRowView(dessert: dessert)
                    }
                }
                .navigationTitle("Desserts")
            }
            if let error = viewModel.networkError { // << error handling here
                ErrorView(errorTitle: error.description)
            }
        }
        .task {
            await viewModel.populateDesserts()
        }
    }
}


