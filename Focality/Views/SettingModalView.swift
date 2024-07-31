//
//  SettingModalView.swift
//  Focality
//
//  Created by Apprenant 123 on 29/07/2024.
//

import SwiftUI

struct SettingModalView: View {
    // État pour déterminer si la feuille est affichée
    @State private var showingSheet = false
    // État pour stocker l'objectif sélectionné
    @State private var selectedObjectif = "Lecture"
    // Liste des objectifs disponibles
    
    @State private var textField1: String = "15"
    @State private var textField2: String = "5"
    @State private var textField3: String = "15"
    
    let objectif = ["Math", "Lecture", "Anglais", "Histoire"]
    
    
    // Accéder au mode de présentation depuis l'environnement
    @Environment(\.presentationMode) var presentationMode
    
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
    
            HStack(spacing: 10) {
                      // Premier TextField
                VStack {
                    Text("Focus")
                        .font(.headline)
                        .frame(width: 110, alignment: .leading)
                        
                    TextField("", text: $textField1)
                        .frame(width: 110, height: 60)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                      // Deuxième TextField
                VStack {
                    Text("Break")
                        .font(.headline)
                        .frame(width: 110, alignment: .leading)
                    TextField("", text: $textField2)
                              .frame(width: 110, height: 60)
                              .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                      // Troisième TextField
                VStack {
                    Text("Rest")
                        .font(.headline)
                        .frame(width: 110, alignment: .leading)
                    TextField("", text: $textField3)
                              .frame(width: 110, height: 60)
                              .textFieldStyle(RoundedBorderTextFieldStyle())
                     }
                  }
               Spacer()
                }
        HStack {
            Button("Annnuler") {
                          print("Bouton tapé!")
            }.frame(width: 130, height:  48,alignment:.center)
                           .background(Color.primaire)
                           .foregroundColor(Color.white)
                       .cornerRadius(16)
         Spacer()
            Button("OK") {
                          print("Bouton tapé!")
            }.frame(width: 129, height:  48,alignment:.center)
                           .background(Color.secondaire)
                           .foregroundColor(Color.white)
                       .cornerRadius(16)
        }.padding()
        Spacer()
    }
}
#Preview {
    SettingModalView()
}

