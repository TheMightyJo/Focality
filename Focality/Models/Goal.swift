//
//  Goal.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import Foundation
class Goal: Identifiable {
    var id = UUID()
    var goalTitle: String
    var startDate: Date
    var endDate: Date
    var goalDescription: String
    var isCompleted: Bool = false
    
    init(goalTitle: String, startDate: Date, endDate: Date, goalDescription: String, isCompleted: Bool) {
        self.id = UUID()
        self.goalTitle = goalTitle
        self.startDate = startDate
        self.endDate = endDate
        self.goalDescription = goalDescription
        self.isCompleted = isCompleted
    }
}
