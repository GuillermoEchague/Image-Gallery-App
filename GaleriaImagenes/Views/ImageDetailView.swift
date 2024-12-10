//
//  ImageDetailView.swift
//  GaleriaImagenes
//
//  Created by Guillermo Echague on 09-12-24.
//

import Foundation
import SwiftUI

struct ImageDetailView: View {
    let image: GalleryImage
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 15) {
                Image(image.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                
                Text(image.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(image.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text("Categoría: \(image.category)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .navigationTitle(image.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
