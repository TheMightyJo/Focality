//
//  AddReminderView.swift
//  Focality
//
//  Created by Apprenant 178 on 05/08/2024.
//

import SwiftUI

struct AddReminderView: View {
    @ObservedObject var viewModel: ReminderViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var titre = ""
    @State private var description = ""
    @State private var date = Date()

    var body: some View {
        NavigationView {
            
            Form {
                TextField("Titre", text: $titre)
                TextField("Description", text: $description)
                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            
            .navigationTitle("Ajouter un Rappel")
            .navigationBarItems(trailing: Button("Enregistrer") {
                viewModel.addRappel(titre: titre, description: description, date: date)
                presentationMode.wrappedValue.dismiss()
            })
            
        }
    }
}

struct AddRappelView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView(viewModel: ReminderViewModel())
    }
}
