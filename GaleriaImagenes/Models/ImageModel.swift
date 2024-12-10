//
//  ImageModel.swift
//  GaleriaImagenes
//
//  Created by Guillermo Echague on 09-12-24.
//

import Foundation

struct GalleryImage: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    let category: String
}
