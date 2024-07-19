//
//  UserViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import SwiftUI

class UserViewModel: ObservableObject{
    @Published var user: User
    init(user: User) {
        self.user = user
    }
    
    func creationFirstName(newFirstName: String){
        user.firstName = newFirstName
    }
    
    func creationLastName(newLastName: String){
        user.lastName = newLastName
    }
    
    func creationMail(newMail: String){
        
        if newMail.contains("@") && newMail.contains("."){
            user.email = newMail
        }else{
            print("email incorrecte wesh!")
        }
    }
    
    func creationPassword(newPassword: String){
        if newPassword.count >= 8{
            user.password = newPassword
        }else{
            print("ton mot de passe c'est de la mede!")
        }
       
    }
    
    func creationBirthday(newBirthday: Date){
        user.birthday = newBirthday
    }
    
    func updatePoint(newPoint: Int){
        user.point = newPoint
    }
    
    func updateCurrentLevel(newCurrentLevel: Int){
        user.currentLevel = newCurrentLevel
    }
}

