//
//  WelcomeView.swift
//  GaleriaImagenes
//
//  Created by Guillermo Echague on 09-12-24.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    @State private var username = ""
    @State private var showError = false
    @State private var animationAmount: CGFloat = 1.0
    
    @AppStorage("lastUsername") private var lastUsername = ""
    @AppStorage("lastScreen") private var lastScreen = "welcome"
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color("GradientStart"), Color("GradientEnd")]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {
                    // Título con efecto pulsante
                    Text("Galería de Imágenes")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .scaleEffect(animationAmount)
                        .animation(
                            Animation.easeInOut(duration: 1.5)
                                .repeatForever(autoreverses: true),
                            value: animationAmount
                        )
                    
                    // Imagen con rotación 3D animada
                    Image(systemName: "photo.stack")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                        .rotation3DEffect(
                            .degrees(Double(animationAmount - 1) * 80),
                            axis: (x: 1.0, y: 0.0, z: 0.0)
                        )
                        .animation(.easeInOut(duration: 1), value: animationAmount)
                    
                    // Campo de texto
                    TextField("Ingresa tu nombre", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(showError ? Color.red : Color.clear, lineWidth: 2)
                        )
                        .animation(.easeInOut, value: showError)
                    
                    // Botón de navegación
                    NavigationLink(destination: ImageListView(username: username)) {
                        Text("Comenzar")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .disabled(username.isEmpty)
                    .simultaneousGesture(TapGesture().onEnded {
                        if username.isEmpty {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                showError = true
                                animationAmount += 0.2 // Breve efecto de "rebote"
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                showError = false
                                animationAmount = 1.1
                            }
                        } else {
                            lastUsername = username
                            lastScreen = "imageList"
                        }
                    })
                }
                .padding()
            }
            .onAppear {
                // Animación inicial
                animationAmount = 1.1
            }
        }
    }
}
