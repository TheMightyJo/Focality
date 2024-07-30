//
//  User.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import Foundation

class User: Identifiable  {
    var id = UUID()
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var birthday: Date
    var point: Int
    var currentLevel: Int
    
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
