//
//  Reward.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import Foundation

struct Reward: Identifiable, Codable {
    let id: UUID
    var title: String
    var description: String
    var requiredPoints: Int
    var isUnlocked: Bool

    init(id: UUID = UUID(), title: String, description: String, requiredPoints: Int, isUnlocked: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.requiredPoints = requiredPoints
        self.isUnlocked = isUnlocked
    }
}
