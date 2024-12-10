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
                    Text("Galería de Imágenes")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .scaleEffect(animationAmount)
                    
                    Image(systemName: "photo.stack")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                        .rotation3DEffect(
                            .degrees(Double(animationAmount - 1) * 20),
                            axis: (x: 1.0, y: 0.0, z: 0.0)
                        )
                    
                    TextField("Ingresa tu nombre", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(showError ? Color.red : Color.clear, lineWidth: 2)
                        )
                    
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
                            withAnimation {
                                showError = true
                                animationAmount += 0.5
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                showError = false
                                animationAmount = 1.0
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
                withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    animationAmount = 1.1
                }
            }
        }
    }
}
