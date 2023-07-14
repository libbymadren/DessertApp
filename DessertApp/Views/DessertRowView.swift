//
//  DessertRowView.swift
//  DessertApp
//
//  Created by Libby Madren on 7/11/23.
//

import SwiftUI
import CachedAsyncImage

struct DessertRowView: View {
    let dessert: DessertViewModelData
        var body: some View {
            HStack {
                CachedAsyncImage(url: dessert.thumbURL) { image in
                    image.resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                } placeholder: {
                    ProgressView()
                }
                
                Text(dessert.title)
            }
        }
}
