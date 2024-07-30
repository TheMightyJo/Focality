//
//  User.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import Foundation

//class User: Identifiable  {

class User: ObservableObject{
    @Published var id = UUID()
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var password: String
    @Published var birthday: Date
    @Published var point: Int
    @Published var currentLevel: Int
    
    init(firstName: String, lastName: String, email: String, password: String, birthday: Date, point: Int, currentLevel: Int) {
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.birthday = birthday
        self.point = point
        self.currentLevel = currentLevel
    }
}
