//
//  ReminderViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import Foundation

class ReminderViewModel: ObservableObject {
    @Published var rappels: [Reminder]

    init(rappels: [Reminder] = []) {
        self.rappels = rappels
    }

    func addRappel(titre: String, description: String, date: Date) {
        let newRappel = Reminder(titre: titre, description: description, date: date)
        rappels.append(newRappel)
    }

    func markAsCompleted(rappel: Reminder) {
        if let index = rappels.firstIndex(where: { $0.id == rappel.id }) {
            rappels[index].isCompleted = true
        }
    }

    func removeRappel(at offsets: IndexSet) {
        rappels.remove(atOffsets: offsets)
    }

    var todayRappels: [Reminder] {
        let today = Calendar.current.startOfDay(for: Date())
        return rappels.filter { Calendar.current.isDate($0.date, inSameDayAs: today) }
    }

    var completedRappels: [Reminder] {
        rappels.filter { $0.isCompleted }
    }
}




