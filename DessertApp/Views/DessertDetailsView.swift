//
//  DessertDetailsView.swift
//  DessertApp
//
//  Created by Libby Madren on 7/12/23.
//

import Foundation
import SwiftUI
import CachedAsyncImage

struct DessertDetailsView: View {
    
    var dessert: DessertViewModelData
    @ObservedObject private var viewModel = DessertDetailsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                CachedAsyncImage(url: viewModel.dessertDetails?.thumbURL) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 20)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                } placeholder: {
                    ProgressView()
                }
                .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    Text("Ingredients:").font(.title3).padding(.bottom, 2)
                    let ingredientsArr = viewModel.dessertDetails?.ingredients ?? []
                    let measureArr = viewModel.dessertDetails?.measurements ?? []
                    ForEach(0..<ingredientsArr.count, id: \.self) { index in
                        HStack {
                            Text("•\t\(ingredientsArr[index])")
                            Text("- \(measureArr[index])").italic()
                        }
                    }
                }
                .padding(.bottom, 20)
                .padding(.leading, 15)
                .padding(.trailing, 15)
                
                VStack(alignment: .leading) {
                    Text("Instructions:").font(.title3).padding(.bottom, 2)
                    ForEach(viewModel.dessertDetails?.instructions ?? [], id: \.self) { instruction in
                        Text(instruction).padding(.bottom, 20)
                    }
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle(viewModel.dessertDetails?.title ?? "", displayMode: .inline)
            .task {
                await viewModel.populateDessertDetails(id: dessert.id)
            }
        }
    }

}
