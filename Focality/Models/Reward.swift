//
//  Reward.swift
//  Focality
//
//  Created par Apprenant 154 le 17/07/2024.
//

import Foundation

/// Un modèle représentant une récompense dans l'application.
///
/// Les récompenses sont gagnées en accumulant un certain nombre de points.
/// Elles ont un titre, une description, et un nombre de points requis pour les déverrouiller.
struct Reward: Identifiable, Codable {
    /// L'identifiant unique de la récompense.
    let id: UUID
    
    /// Le titre de la récompense.
    var title: String
    
    /// Une description de la récompense.
    var description: String
    
    /// Le nombre de points requis pour déverrouiller la récompense.
    var requiredPoints: Int
    
    /// Une valeur booléenne indiquant si la récompense est déverrouillée.
    var isUnlocked: Bool

    /// Initialise une nouvelle récompense avec les détails spécifiés.
    ///
    /// - Parameters:
    ///   - id: L'identifiant unique de la récompense. Par défaut, il s'agit d'un nouvel UUID.
    ///   - title: Le titre de la récompense.
    ///   - description: Une description de la récompense.
    ///   - requiredPoints: Le nombre de points requis pour déverrouiller la récompense.
    ///   - isUnlocked: Une valeur booléenne indiquant si la récompense est déverrouillée. Par défaut, elle est `false`.
    init(id: UUID = UUID(), title: String, description: String, requiredPoints: Int, isUnlocked: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.requiredPoints = requiredPoints
        self.isUnlocked = isUnlocked
    }
}
