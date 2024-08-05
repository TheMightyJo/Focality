//
//  ContentView.swift
//  Timer
//
//  Created by Apprenant 123 on 11/07/2024.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var viewModel = TimerViewModel(isRunning: false, currentTime: 1500) // Instance du ViewModel pour gérer l'état
    @State private var showingSheet = false // État pour déterminer si la feuille de paramètres est affichée
    
    
    var body: some View {
        VStack {
            ZStack {
                Ellipse()
                    .stroke(Color.primaire, lineWidth: 4) // Bordure de l'ellipse
                    .fill(.white)
                    .frame(width: 227, height: 227)
                VStack {
                    Text(formatTime(viewModel.currentTime)) // Affichage du temps formaté
                        .font(.system(size: 65))
                        .foregroundColor(Color.primaire)
                        .padding()
                    Text("Lecture") // Label statique pour cet exemple
                        .foregroundColor(Color.black)
                        .font(.title)
                }
            }
            Spacer()
            // Barre de contrôles (Play/Pause et Skip Forward)
            HStack {
                // Bouton Play/Pause
                Button(action: {
                    // Toggle entre démarrer et mettre en pause le timer
                    viewModel.setCurrentTime()// ajouté avec zora
                    if viewModel.isRunning {
                        viewModel.pauseTimer()
                    } else {
                        viewModel.startTimer()
                    }
                }) {
                    ZStack {
                        Ellipse()
                            .fill(Color.primaire)
                            .frame(width: 54, height: 54)
                            .padding()
                        Image(systemName: viewModel.isRunning ? "pause.fill" : "play.fill") // Icône dynamique
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 26)
                            .foregroundColor(Color(.black))
                            .padding(.leading, 5)
                    }
                }
                // Bouton Skip Forward
                Button(action: {
                   viewModel.skipForward()
                }) {
                   Image("Skip Forward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 25.26)
                               }
            }.padding(.leading,30)
            Spacer()
            HStack {
                Ellipse()
                    .fill(.primaire)
                    .frame(width: 24, height: 24)
                Ellipse()
                    .fill(.primaire)
                    .frame(width: 24, height: 24)
                Ellipse()
                    .fill(.primaire)
                    .frame(width: 24, height: 24)
                Ellipse()
                    .fill(.primaire)
                    .frame(width: 24, height: 24)
            }
            Spacer()
            Text("Focus Time")
                .font(.largeTitle)
                .foregroundStyle(.primaire)
                .frame(width: 174, height: 39)
            Spacer()
            ZStack {
                Ellipse()
                    .fill(.primaire)
                .frame(width: 40, height: 40)
                Image("Button Setting")
            }
            .onTapGesture {
                showingSheet.toggle()
                        }
            .sheet(isPresented: $showingSheet) {
                SettingModalView(viewModel: viewModel)
    
            }
            Spacer()
        }
    }
    // Fonction pour formater le temps en minutes et secondes
    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds) // Formatage pour afficher sous forme MM:SS
    }
}

#Preview {
    TimerView()
}
