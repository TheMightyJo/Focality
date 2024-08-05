//
//  Reminder.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import Foundation

struct Reminder: Identifiable {
    var id = UUID()
    var titre: String
    var description: String
    var date: Date
    var isCompleted: Bool = false
}
