//
//  SettingModalView.swift
//  Focality
//
//  Created by Apprenant 123 on 29/07/2024.
//

import SwiftUI

struct SettingModalView: View {
    
    // État pour déterminer si la feuille est affichée
    @ObservedObject var viewModel: TimerViewModel // Référence au ViewModel pour mettre à jour les paramètres
    @State private var showingSheet = false // État pour stocker l'objectif sélectionné
    @State private var selectedObjectif = "Lecture"// Objectif sélectionné
    @State private var focusTime: String = "25" // Temps de concentration en minutes
    @State private var shortBreak: String = "5" // Temps de pause courte en minutes
    @State private var longBreak: String = "15" // Temps de pause longue en minutes
    
    let objectif = ["Math", "Lecture", "Anglais", "Histoire"]
    
    @Environment(\.presentationMode) var presentationMode // Accéder au mode de présentation depuis l'environnement
    
    var body: some View {
        VStack {
            // Barre supérieure avec le bouton pour fermer la modale
            HStack {
                Button(action: {
                    // Action pour fermer la modale
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image("Vector") // Image de retour
                        Text("Paramétrage") // Titre de la modale
                    }.foregroundColor(.black)
                }
                .padding(.leading)
                
                Spacer() // Espace flexible pour pousser le contenu vers la gauche
            }
            // Ligne de séparation
            Divider()
                .frame(height: 1)
                .background(Color.black)
            Spacer()
            Text("Sélectionner un objectif:")
                .fontWeight(.medium)
                .font(.system(size: 20))
            
            // Formulaire avec un picker pour sélectionner un objectif
            
            Section {
                Picker("objectif", selection: $selectedObjectif) {
                    // Boucle sur les objectifs disponibles pour créer les éléments du picker
                    ForEach(objectif, id: \.self) {
                        Text($0) // Affiche le texte de chaque objectif
                    }
                }
                .pickerStyle(.wheel) // Style du picker en forme de roue
            }
            Spacer()
            
            // Formulaire pour entrer les temps de concentration et de pause
            HStack() {
                Group {
                    TimeSettingView(label: "Focus", text: $focusTime) // Vue pour le temps de concentration
                    TimeSettingView(label: "Break", text: $shortBreak) // Vue pour la pause courte
                    TimeSettingView(label: "Rest", text: $longBreak) // Vue pour la pause longue
                }
            }
            Spacer()
            HStack(spacing: 65){
                Button("Annnuler") {
                    print("Bouton tapé!")
                }.frame(width: 130, height:  48,alignment:.center)
                    .background(Color.primaire)
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
                
                Button("OK") {
                    print("Bouton tapé!")
                }.frame(width: 129, height:  48,alignment:.center)
                    .background(Color.secondaire)
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
            }
            .padding()
            Spacer()
        }
    }
    // Vue pour les champs de saisie de temps
    struct TimeSettingView: View {
        var label: String // Label pour le champ de saisie
        @Binding var text: String // Liaison des données pour le champ de saisie
        
        var body: some View {
            VStack {
                Text(label)
                    .font(.headline)
                    .frame(width: 110, alignment: .center)
                TextField("", text: $text)
                    .padding(5)
                    .background(Color(red: 0.957, green: 0.957, blue: 0.961))
                    .frame(width: 90, height: 60)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad) // Clavier numérique pour la saisie des temps
            }
        }
    }
}
#Preview {
    SettingModalView(viewModel: TimerViewModel(isRunning: true, currentTime: 100))

}
