//
//  UserViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import SwiftUI

class UserViewModel: ObservableObject{
    @Published var users: [User] = []
    init() {
        self.users = [
            User( firstName: "Dembo", lastName: "Babar", email: "dembo@gmail.com", password: "Teamcook5*", birthday: Date(), point: 55, currentLevel: 150),
            User( firstName: "Patrice", lastName: "Babar", email: "paterice@gmail.com", password: "Teamcook5*", birthday: Date(), point: 55, currentLevel: 150),
            User( firstName: "Sofian", lastName: "Babar", email: "sofian@gmail.com", password: "Teamcook5*", birthday: Date(), point: 55, currentLevel: 150),
            User( firstName: "Johan", lastName: "Babar", email: "johan@gmail.com", password: "Teamcook5*", birthday: Date(), point: 55, currentLevel: 150),
            User( firstName: "Emiliano", lastName: "Babar", email: "emiliano@gmail.com", password: "Teamcook5*", birthday: Date(), point: 55, currentLevel: 150)
        ]
    }
    

    
    func addUser(firstName: String, lastName: String,email: String, password: String, birthday: Date){
        if email.contains("@") && email.contains(".") && password.count >= 8 {
            let newUser = User(firstName: firstName, lastName: lastName, email: email, password: password, birthday: birthday, point: 0, currentLevel: 0)
            users.append(newUser)
        }else{
            print("le mot de passe et l'email ne correspondent pas aux éléments requis")
        }
            
       
    }

    
    
}
