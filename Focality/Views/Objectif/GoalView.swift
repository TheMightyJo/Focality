//
//  GoalView.swift
//  Focality
//
//  Created by Apprenant 165 on 30/07/2024.
//

import SwiftUI

struct GoalView: View {
    @StateObject var viewGoals = GoalViewModel()
    
    var body: some View {
        HStack {
            Text("Objectifs")
                .font(.title)
                .padding()
            Spacer()
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
        }
        NavigationStack {
            List(viewGoals.goals) { goal in
                NavigationLink {
                    GoalDetailView(goals: Goal(goalTitle: String(), startDate: Date(), endDate: Date(), goalDescription: String(), isCompleted: Bool()))
                } label: {
                    GoalRowView(titreObj: goal.goalTitle, icon: "circle.badge.checkmark.fill")
                }
            }
        }
    }
}

#Preview {
    GoalView()
}
