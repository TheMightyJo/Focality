//
//  Challenge.swift
//  Focality
//
//  Created by Johan Quille on 20/07/2024.
//

import Foundation

/// Modèle représentant un défi.
///
/// Chaque défi contient des informations telles que le titre, la description,
/// le statut d'achèvement et le nombre de points associés.
struct Challenge: Identifiable, Codable {
    /// L'identifiant unique du défi.
    let id: UUID
    
    /// Le titre du défi.
    var title: String
    
    /// La description du défi.
    var description: String
    
    /// Indique si le défi est complété.
    var isCompleted: Bool
    
    /// Le nombre de points associés au défi.
    var points: Int

    /// Initialise un nouveau défi avec les valeurs spécifiées.
    ///
    /// - Parameters:
    ///   - id: L'identifiant unique du défi. Par défaut, une nouvelle valeur UUID est générée.
    ///   - title: Le titre du défi.
    ///   - description: La description du défi.
    ///   - isCompleted: Indique si le défi est complété. La valeur par défaut est `false`.
    ///   - points: Le nombre de points associés au défi.
    init(id: UUID = UUID(), title: String, description: String, isCompleted: Bool = false, points: Int) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
        self.points = points
    }
}
