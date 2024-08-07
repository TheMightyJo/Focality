//
//  TimerDetailView.swift
//  Focality
//
//  Created by Apprenant 123 on 06/08/2024.
//

import SwiftUI

/// Une vue représentable UIKit pour afficher les détails du timer dans une interface SwiftUI
struct TimerDetailView: UIViewControllerRepresentable {
    
    /// Mise à jour du UIViewController avec les nouvelles données ou le contexte SwiftUI
    /// - Parameters:
    ///   - uiViewController: Le UIViewController à mettre à jour
    ///   - context: Le contexte SwiftUI associé à la vue
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Fonction laissée vide intentionnellement
    }
    
    /// L'instance de TimerPomodoro contenant les paramètres du timer
    var timer: TimerPomodoro
    
    /// Création du UIViewController initialisé avec les données de TimerPomodoro
    /// - Parameter context: Le contexte SwiftUI associé à la vue
    /// - Returns: Une instance de TimerViewController initialisée
    func makeUIViewController(context: Context) -> some TimerViewController {
        let storyboard = UIStoryboard(name: "MainTimerPat", bundle: .main)
        guard let timerVc = storyboard.instantiateViewController(withIdentifier: "TimerViewController") as? TimerViewController else {
            fatalError("Cannot instantiate TimerViewController from storyboard")
        }
        timerVc.chrono = timer
        return timerVc
    }
}
