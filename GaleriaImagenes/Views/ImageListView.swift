//
//  ImageListView.swift
//  GaleriaImagenes
//
//  Created by Guillermo Echague on 09-12-24.
//

import Foundation
import SwiftUI

struct ImageListView: View {
    let username: String
    @State private var showInfoModal = false
    @State private var selectedImage: GalleryImage?
    
    @AppStorage("lastUsername") private var lastUsername = ""
    @AppStorage("lastScreen") private var lastScreen = "welcome"
    
    let images: [GalleryImage] = [
        GalleryImage(title: "León Africano", description: "Rey de la sabana", imageName: "lion1", category: "Animales Salvajes"),
        GalleryImage(title: "Leopardo", description: "Sigilo y elegancia", imageName: "leopard1", category: "Animales Salvajes"),
        GalleryImage(title: "Elefante", description: "Majestuoso gigante africano", imageName: "elephant1", category: "Animales Salvajes"),
        GalleryImage(title: "Guepardo", description: "El corredor más rápido del planeta", imageName: "cheetah1", category: "Animales Salvajes"),
        GalleryImage(title: "Cebra", description: "Patrón único de rayas", imageName: "zebra1", category: "Animales Salvajes"),
        GalleryImage(title: "Hiena", description: "Cazador inteligente de la sabana", imageName: "hyena1", category: "Animales Salvajes"),
        GalleryImage(title: "Jirafa", description: "Cuello largo y elegante", imageName: "giraffe1", category: "Animales Salvajes"),
        GalleryImage(title: "Rinoceronte", description: "Armadura viviente", imageName: "rhino1", category: "Animales Salvajes"),
        GalleryImage(title: "Búfalo", description: "Fuerza y resistencia", imageName: "buffalo1", category: "Animales Salvajes"),
        GalleryImage(title: "Gorila", description: "Inteligencia y poder", imageName: "gorilla1", category: "Animales Salvajes"),
        GalleryImage(title: "Tigre de Bengala", description: "Depredador majestuoso", imageName: "tiger1", category: "Animales Salvajes"),
        GalleryImage(title: "Pantera Negra", description: "Sigilo nocturno", imageName: "panther1", category: "Animales Salvajes"),
        GalleryImage(title: "Cocodrilo", description: "Superviviente prehistórico", imageName: "crocodile1", category: "Animales Salvajes"),
        GalleryImage(title: "Meerkat", description: "Centinela del desierto", imageName: "meerkat1", category: "Animales Salvajes"),
        GalleryImage(title: "Suricata", description: "Comunidad y vigilancia", imageName: "suricate1", category: "Animales Salvajes"),
        GalleryImage(title: "Antílope", description: "Velocidad y agilidad", imageName: "antelope1", category: "Animales Salvajes"),
        GalleryImage(title: "Buitre", description: "Limpiador del ecosistema", imageName: "vulture1", category: "Animales Salvajes"),
        GalleryImage(title: "Hipopótamo", description: "Gigante acuático", imageName: "hippo1", category: "Animales Salvajes"),
        GalleryImage(title: "Chacal", description: "Adaptable y astuto", imageName: "jackal1", category: "Animales Salvajes"),
        GalleryImage(title: "Gnu", description: "Gran migración", imageName: "gnu1", category: "Animales Salvajes")
    ]
    
    var body: some View {
        NavigationView {
            List(images) { image in
                NavigationLink(destination: ImageDetailView(image: image)) {
                    HStack {
                        Image(image.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text(image.title)
                                .font(.headline)
                            Text(image.category)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle(username)
            .navigationBarItems(
                leading: Button("Atrás") {
                    // Lógica de retorno
                },
                trailing: Button(action: {
                    showInfoModal = true
                }) {
                    Image(systemName: "info.circle")
                }
            )
            .sheet(isPresented: $showInfoModal) {
                VStack(spacing: 20) {
                    Text("Información de la Aplicación")
                        .font(.title)
                    
                    List {
                        Text("Nombre: Galería de Imágenes")
                        Text("Desarrollador: Guillermo Echague")
                        Text("Versión: 1.0.0")
                        Text("Fecha de Creación: Dic 2024")
                        Text("Plataforma: iOS")
                    }
                }
                .presentationDetents([.medium, .large])
            }
        }
        .onAppear {
            lastUsername = username
            lastScreen = "imageList"
        }
    }
}
