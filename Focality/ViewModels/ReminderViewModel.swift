//
//  ReminderViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import SwiftUI

class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = []
    init() {
        self.reminders = [
            Reminder(rappelTitle: "Math à 14h", rappelDate: Date(), rappelDescription: "Je dois travailler le théoreme de pythagore")
        ]
    }
    }




