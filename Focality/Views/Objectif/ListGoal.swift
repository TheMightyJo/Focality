//
//  ListGoal.swift
//  Focality
//
//  Created by Apprenant 165 on 06/08/2024.
//

import SwiftUI

enum GoalFilter {
    case aCompleter, all, completer
}

struct ListGoal: View {
    @ObservedObject var viewModel: GoalViewModel
    var filter: GoalFilter

    var filteredGoals: [Goal] {
        switch filter {
        case .aCompleter:
            return viewModel.nonCompletedGoals
        case .all:
            return viewModel.goals
        case .completer:
            return viewModel.completedGoals
        }
    }

    var body: some View {
        List {
            ForEach(filteredGoals) { goal in
                NavigationLink {
                    GoalDetailView.init(goals: Goal(goalTitle: String(), startDate: Date(), endDate: Date(), goalDescription: String(), isCompleted: Bool()))
                } label: {
                    HStack {
            Image(systemName: "circle.badge.checkmark.fill")
                .resizable()
                .frame(width:35, height: 30)
                .foregroundStyle(.blue)
        VStack(alignment: .leading) {
            Text(goal.goalTitle).font(.headline)
        HStack{
            Text(goal.startDate, style: .date).font(.caption)
            Text("-")
            Text(goal.endDate, style: .date).font(.caption)
        }
    }
}
                }

            }
            .onDelete(perform: viewModel.removeGoal)
        }
        .navigationTitle(title)
    }

    var title: String {
        switch filter {
        case .aCompleter:
            return "Objectif a terminer"
        case .all:
            return "Tous les objectifs"
        case .completer:
            return "Objectifs terminé"
        }
    }
}

struct GoalListView_Previews: PreviewProvider {
    static var previews: some View {
        ListGoal(viewModel: GoalViewModel(), filter: .all)
    }
}
