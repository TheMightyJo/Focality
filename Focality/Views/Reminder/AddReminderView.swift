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
    @State private var date = ""
    @State private var isCompleted = Bool()
    
    var onSave: (() -> Void)?

    var body: some View {
        NavigationView {
            
            Form {
                TextField("Titre", text: $titre)
                TextField("Description", text: $description)
                TextField("Date", text: $date)
            }
            
            .navigationTitle("Ajouter un Rappel")
            .navigationBarItems(trailing: Button("Enregistrer") {
                let newReminder = Reminder(id: UUID(), titre: titre, description: description, date: date, isCompleted: isCompleted )
                viewModel.addReminder(newReminder)
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
