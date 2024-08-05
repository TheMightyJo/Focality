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
    
    private var timer: Timer? // Référence au Timer pour gérer le compte à rebours
    
    init(timers: TimerPomodoro = TimerPomodoro(focusTime: 25, shortBreak: 5, longBreak: 15), isRunning: Bool, currentTime: Int = 0) {
        self.timers = timers
        self.isRunning = isRunning
        self.currentTime = currentTime //Initialiser currentTime
        if isRunning {
                    startTimer() // Démarrer le timer si l'état est en cours
                }
    }
    // Méthode pour définir le currentTime basé sur focusTime
        func setCurrentTime() {
            self.currentTime = timers.focusTime * 60 // Convertir le focusTime en secondes pour le timer
    }
    // Démarrer le timer
    func startTimer() {
        guard !isRunning else { return } // Ne pas démarrer si déjà en cours

               isRunning = true
               timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                   self?.tick()
               }
    }
    
    // Mettre en pause le timer
    func pauseTimer() {
           isRunning = false
           timer?.invalidate() // Arrêter le Timer
           timer = nil // Réinitialiser la référence au Timer
       }
    
    // Avancer le timer
    func skipForward() {
        pauseTimer()
        self.currentTime = 0
    }
    
    // Mettre à jour les paramètres du timer
    func updateTimer(focusTime: Int, shortBreak: Int, longBreak: Int) {
            self.timers = TimerPomodoro(focusTime: focusTime, shortBreak: shortBreak, longBreak: longBreak)
            setCurrentTime() // Réinitialiser le temps restant en fonction du nouveau focusTime
        }

        // Méthode appelée chaque seconde pour décrémenter le temps
        private func tick() {
            if currentTime > 0 {
                currentTime -= 1
            } else {
                pauseTimer() // Arrêter le timer lorsqu'il atteint zéro
            }
    }
}
