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
    
    init(goalTitle: String, startDate: Date, endDate: Date, goalDescription: String) {
        self.id = UUID()
        self.goalTitle = goalTitle
        self.startDate = startDate
        self.endDate = endDate
        self.goalDescription = goalDescription
    }
}
