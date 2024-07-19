//
//  GoalViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import SwiftUI

class GoalViewModel: ObservableObject {
    @Published private var goals: [Goal] = []
    init(goals: [Goal]) {
        
        self.goals = [
            Goal.init(goalTitle: "Anglais", startDate: Date(), endDate: Date(), goalDescription: "Passage de B1 a C1 en 9 mois")
        ]
        
    }
    func addGoal(goalTitle: String, starteDate: Date, endDate: Date, goalDescription: String) {
        let newGoal = Goal.init(goalTitle: goalTitle, startDate: Date(), endDate: Date(), goalDescription: goalDescription)
        goals.append(newGoal)
    }
}

