//
//  AddGoal.swift
//  Focality
//
//  Created by Apprenant 165 on 02/08/2024.
//

import SwiftUI

struct AddGoal: View {
    @ObservedObject var viewModel: GoalViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var titre = ""
    @State private var dateDebut = Date()
    @State private var dateFin = Date()
    @State private var description = ""
    @State private var completer = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Text("Quel est ton objectif ?")
                    TextField("Titre", text: $titre)
                        .padding(.bottom)
                        .padding(.top)
                    Text("Periode de temps :")
                    HStack {
                        Text("Du :")
                        DatePicker("", selection: $dateDebut, displayedComponents: .date)
                        Text("au :")
                        DatePicker("", selection: $dateFin, displayedComponents: .date)
                    }
                    
                    Text("Details de ton objectif :")
                    
                    TextField("Description", text: $description)
                        .padding(.bottom).padding(.bottom)
                        .padding(.bottom)   .padding(.bottom)
                    Toggle(isOn: $completer) {
                        Text("Completer")
                    }
                }
                Button(action: {
                    viewModel.addGoal(goalTitle: titre, startDate: dateDebut, endDate: dateFin, goalDescription: description, isCompleted: completer)
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 50)
                        Text("Ajouter")
                            .font(.title)
                            .foregroundStyle(.black)
                    }
                })
            }
            .navigationTitle("Defini ton objectif")
        }
    }
}

struct AddGoal_Previews: PreviewProvider {
    static var previews: some View {
        AddGoal(viewModel: GoalViewModel())
    }
}
