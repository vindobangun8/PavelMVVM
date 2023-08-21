//
//  ImagePreviewView.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 21/08/23.
//

import Foundation
import SwiftUI
struct ImagePreviewView: View {
    @Binding var path: [Screen]
    @Binding var imageHasBeenChosen: Bool
    
    var image: Image
    
    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()
        }.toolbar {
            Button("Save") {
                imageHasBeenChosen = true
                _ = path.popLast()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}
