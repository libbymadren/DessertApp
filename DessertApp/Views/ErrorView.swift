//
//  ErrorView.swift
//  DessertApp
//
//  Created by Libby Madren on 7/14/23.
//

import Foundation
import SwiftUI


struct ErrorView: View {
    let errorTitle: String
    
    var body: some View {
        VStack {
            Text(errorTitle)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 300, height: 200)
                .background(Rectangle().fill(Color(white: 0.75)))
        }
                
    }
}
