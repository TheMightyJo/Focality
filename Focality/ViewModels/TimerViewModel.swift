//
//  TimerViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import SwiftUI

/// ViewModel pour le chronomètre Pomodoro
class TimerViewModel: ObservableObject {
    /// Instance de Timer contenant les paramètres
    @Published var timers: TimerPomodoro
    /// État pour savoir si le timer est en cours
    @Published var isRunning: Bool = false
    /// Temps restant en secondes
    @Published var currentTime: Int = 0
    
    private var timer: Timer?
    
    /// Initialisateur
    /// - Parameters:
    ///   - timers: Instance de TimerPomodoro
    ///   - isRunning: État initial du timer
    ///   - currentTime: Temps initial en secondes
    init(timers: TimerPomodoro = TimerPomodoro(focusTime: 25, shortBreak: 5, longBreak: 15), isRunning: Bool, currentTime: Int) {
        self.timers = timers
        self.isRunning = isRunning
        self.currentTime = currentTime
    }
    
    /// Méthode pour définir le currentTime basé sur focusTime
    func setCurrentTime() {
        self.currentTime = timers.focusTime * 60
    }
    
    /// Démarrer le timer
    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }
    
    /// Mettre en pause le timer
    func pauseTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    /// Avancer le timer
    func skipForward() {
        // Logique pour avancer le timer
    }
    
    /// Mettre à jour les paramètres du timer
    /// - Parameters:
    ///   - focusTime: Nouveau temps de concentration
    ///   - shortBreak: Nouveau temps de pause courte
    ///   - longBreak: Nouveau temps de pause longue
    func updateTimer(focusTime: Int, shortBreak: Int, longBreak: Int) {
        self.timers = TimerPomodoro(focusTime: focusTime, shortBreak: shortBreak, longBreak: longBreak)
        self.currentTime = focusTime * 60
    }
    
    /// Méthode appelée chaque seconde pour mettre à jour le temps restant
    private func tick() {
        if currentTime > 0 {
            currentTime -= 1
        } else {
            pauseTimer()
        }
    }
}

