//
//  Challenge.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import Foundation

/// Un modèle représentant un challenge dans l'application.
///
/// Les challenges sont des tâches ou des objectifs que l'utilisateur peut compléter.
/// Chaque challenge a un titre, une description, et un état d'accomplissement.
/// Ces objectifs sont lancés automatiquement lors de la création du compte utilisateur.
struct Challenge: Identifiable, Codable {
    /// L'identifiant unique du challenge.
    let id: UUID
    
    /// Le titre du challenge.
    var title: String
    
    /// Une description du challenge.
    var description: String
    
    /// Une valeur booléenne indiquant si le challenge est complété.
    var isCompleted: Bool

    /// Initialise un nouveau challenge avec les détails spécifiés.
    ///
    /// - Parameters:
    ///   - id: L'identifiant unique du challenge. Par défaut, il s'agit d'un nouvel UUID.
    ///   - title: Le titre du challenge.
    ///   - description: Une description du challenge.
    ///   - isCompleted: Une valeur booléenne indiquant si le challenge est complété. Par défaut, elle est `false`.
    init(id: UUID = UUID(), title: String, description: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
    }
}
