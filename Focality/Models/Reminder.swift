//
//  Reminder.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import Foundation

struct Reminder: Identifiable, Codable {
    var id = UUID()
    var titre: String
    var description: String
    var date: String
    var isCompleted: Bool = false
}
