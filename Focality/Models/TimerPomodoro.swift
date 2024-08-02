//
//  Timer.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import Foundation

class TimerPomodoro: Identifiable {
    var id = UUID() // Identifiant unique pour le timer
    var focusTime: Int // Durée de la session de concentration en minutes
    var shortBreak: Int // Durée de la pause courte en minutes
    var longBreak: Int // Durée de la pause longue en minutes

    // Initialisateur pour définir les valeurs du timer
    init(id: UUID = UUID(), focusTime: Int, shortBreak: Int, longBreak: Int) {
        self.id = id
        self.focusTime = focusTime
        self.shortBreak = shortBreak
        self.longBreak = longBreak
    }
}
