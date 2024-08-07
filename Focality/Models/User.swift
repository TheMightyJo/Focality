//
//  User.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import Foundation

//class User: Identifiable  {
/// La classe User représente un utilisateur avec ses attributs
class User: Identifiable{
/// id est un identifiant unique pour chaque instance de `User`, généré à l'aide de `UUID()`.
    @Published var id = UUID()
/// firstName est le prénom de l'utilisateur.
    @Published var firstName: String
/// lastName  est le nom de famille de l'utilisateur.
    @Published var lastName: String
/// email  est l'adresse email de l'utilisateur.
    @Published var email: String
/// password est le mot de passe de l'utilisateur.
    @Published var password: String
/// birthday est la date de naissance de l'utilisateur.
    @Published var birthday: Date
/// point représente le nombre de points de l'utilisateur.
    @Published var point: Int
/// currentLevel représente le niveau actuel de l'utilisateur.
    @Published var currentLevel: Int
    
/// Initialisation des attributs de la classe User
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
    
    func addPoints(_ points: Int) {
            self.point += points
        }
}
