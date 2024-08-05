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
    func addGoal(goalTitle: String, startDate: Date, endDate: Date, goalDescription: String, isCompleted: Bool) {
        let newGoal = Goal(goalTitle: goalTitle, startDate: startDate, endDate: endDate, goalDescription: goalDescription, isCompleted: true)
        goals.append(newGoal)
    }
    func removeGoal(at offsets: IndexSet) {
        goals.remove(atOffsets: offsets)
    }
    func checkMarkGoal(goal: Goal) {
        if let index = goals.firstIndex(where: { $0.id == goal.id}) {
            goals[index].isCompleted = true
        }
    }
    var completedGoals: [Goal] {
        goals.filter { $0.isCompleted }
    }
}




