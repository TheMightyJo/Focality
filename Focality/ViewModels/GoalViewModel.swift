//
//  GoalViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import SwiftUI

class GoalViewModel: ObservableObject {
    @Published var goals: [Goal]
    init(goals: [Goal] = []) {
        
        self.goals = goals
    }
    func addGoal(goalTitle: String, startDate: String, endDate: String, goalDescription: String, isCompleted: Bool) {
        let newGoal = Goal.init(goalTitle: goalTitle, startDate: startDate, endDate: endDate, goalDescription: goalDescription, isCompleted: true)
        goals.append(newGoal)
    }
}




