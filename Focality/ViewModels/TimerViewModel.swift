//
//  TimerViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timers: TimerPomodoro // Instance de Timer contenant les paramètres
    @Published var isRunning: Bool = false // État pour savoir si le timer est en cours
    @Published var currentTime: Int = 0// Temps restant en secondes
    private var timer: Timer.TimerPublisher? // Timer pour gérer le compte à rebours
    private var cancellable: AnyCancellable? // Pour annuler le Timer
    
    init(timers: TimerPomodoro = TimerPomodoro(focusTime: 15, shortBreak: 5, longBreak: 15), isRunning: Bool, currentTime: Int) {
        self.timers = timers
        self.isRunning = isRunning
        self.currentTime = currentTime //Initialiser currentTime
    }
    // Méthode pour définir le currentTime basé sur focusTime
        func setCurrentTime() {
            self.currentTime = timers.focusTime * 60 // Convertir le focusTime en secondes pour le timer
    }
    // Démarrer le timer
    func startTimer() {
        isRunning = true
        // Démarrer le timer
    }
    
    // Mettre en pause le timer
    func pauseTimer() {
        isRunning = false
        // mettre en pause le timer
    }
    
    // Avancer le timer
    func skipForward() {
        // avancer le timer
    }
    
    // Mettre à jour les paramètres du timer
    func updateTimer(focusTime: Int, shortBreak: Int, longBreak: Int) {
        self.timers = TimerPomodoro(focusTime: focusTime, shortBreak: shortBreak, longBreak: longBreak)
        self.currentTime = focusTime * 60 // Réinitialiser le temps restant en fonction du nouveau focusTime
    }
}
