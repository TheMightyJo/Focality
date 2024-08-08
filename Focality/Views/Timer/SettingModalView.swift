//
//  SettingModalView.swift
//  Focality
//
//  Created by Apprenant 123 on 29/07/2024.
//

import SwiftUI
/// Vue pour la modale des paramètres
struct SettingModalView: View {
    
    /// Référence au ViewModel pour mettre à jour les paramètres
    @ObservedObject var viewModel: TimerViewModel
    /// État pour déterminer si la feuille est affichée
    @State private var showingSheet = false
    /// Objectif sélectionné
    @State private var selectedObjectif = "Lecture"
    /// Temps de concentration en minutes
    @State private var focusTime: String = "25"
    /// Temps de pause courte en minutes
    @State private var shortBreak: String = "5"
    /// Temps de pause longue en minutes
    @State private var longBreak: String = "15" // Temps de pause longue en minutes
    
    /// Liste des objectifs disponibles en dur
    let objectif = ["Math", "Lecture", "Anglais", "Histoire"]
    
    /// Accéder au mode de présentation depuis l'environnement
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
                Button(action: {
                    // Action pour fermer la modale
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("Annuler")
                            .frame(width: 130, height:  48,alignment:.center)
                            .background(Color.primaire)
                            .foregroundColor(Color.white)
                            .cornerRadius(16)
                    }
                }
                Button(action: {
             
                }) {
                    HStack {
                        Text("OK")
                            .frame(width: 130, height:  48,alignment:.center)
                            .background(Color.secondaire)
                            .foregroundColor(Color.white)
                            .cornerRadius(16)
                    }
                }
            }
            .padding()
            Spacer()
        }
        .padding()
    }
    /// Vue pour les champs de saisie de temps
    struct TimeSettingView: View {
        /// Label pour le champ de saisie
        var label: String
        /// Liaison des données pour le champ de saisie
        @Binding var text: String
        
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
