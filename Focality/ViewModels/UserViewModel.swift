//
//  UserViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import SwiftUI

/// La classe UserViewModel gère une collection d'utilisateurs et permet l'ajout de nouveaux utilisateurs.
/// Elle implémente le protocole ObservableObject ce qui signifie que les changements d'état dans cette classe peuvent être observés par des vues SwiftUI..
class UserViewModel: ObservableObject{
/// users est un objets User. Cette propriété est observable et toute modification entraînera une mise à jour de l'interface utilisateur.
    @Published var users: [User] = []
/// Initialisation de la classe UserViewModel.
/// Création et ajoute d'une liste initiale d'utilisateurs à la propriété users.
        
    init() {
        self.users = [
            User( firstName: "Dembo", lastName: "Babar", email: "dembo@gmail.com", password: "Teamcook5*", birthday: Date(), point: 55, currentLevel: 150),
            User( firstName: "Patrice", lastName: "Babar", email: "paterice@gmail.com", password: "Teamcook5*", birthday: Date(), point: 55, currentLevel: 150),
            User( firstName: "Sofian", lastName: "Babar", email: "sofian@gmail.com", password: "Teamcook5*", birthday: Date(), point: 55, currentLevel: 150),
            User( firstName: "Johan", lastName: "Babar", email: "johan@gmail.com", password: "Teamcook5*", birthday: Date(), point: 55, currentLevel: 150),
            User( firstName: "Emiliano", lastName: "Babar", email: "emiliano@gmail.com", password: "Teamcook5*", birthday: Date(), point: 55, currentLevel: 150)
        ]
    }
    

/// Ajoute un nouvel utilisateur à la liste users.
///
    func addUser(firstName: String, lastName: String,email: String, password: String, birthday: Date){
/// On vérifie que l'email contient un "@" et un ".", et que le mot de passe a au moins 8 caractères avant d'ajouter l'utilisateur.
        if email.contains("@") && email.contains(".") && password.count >= 8 {
            let newUser = User(firstName: firstName, lastName: lastName, email: email, password: password, birthday: birthday, point: 0, currentLevel: 0)
            users.append(newUser)
        }else{
            print("le mot de passe et l'email ne correspondent pas aux éléments requis")
        }
            
       
    }

    
    
}
