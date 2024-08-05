//
//  ReminderListView.swift
//  Focality
//
//  Created by Apprenant 178 on 05/08/2024.
//

import SwiftUI

enum RappelFilter {
    case today, all, completed
}

struct ReminderListView: View {
    @ObservedObject var viewModel: ReminderViewModel
    var filter: RappelFilter

    var filteredRappels: [Reminder] {
        switch filter {
        case .today:
            return viewModel.todayRappels
        case .all:
            return viewModel.rappels
        case .completed:
            return viewModel.completedRappels
        }
    }

    var body: some View {
        List {
            ForEach(filteredRappels) { rappel in
                VStack(alignment: .leading) {
                    Text(rappel.titre).font(.headline)
                    Text(rappel.description).font(.subheadline)
                    Text(rappel.date, style: .date).font(.caption)
                }
            }
            .onDelete(perform: viewModel.removeRappel)
        }
        .navigationTitle(title)
    }

    var title: String {
        switch filter {
        case .today:
            return "Rappels d'aujourd'hui"
        case .all:
            return "Tous les rappels"
        case .completed:
            return "Rappels terminés"
        }
    }
}

struct RappelsListView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderListView(viewModel: ReminderViewModel(), filter: .all)
    }
}
