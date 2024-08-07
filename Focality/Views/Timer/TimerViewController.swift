//
//  TimerViewController.swift
//  Focality
//
//  Created by Apprenant 123 on 05/08/2024.
//

import UIKit

/// Une vue contrôleur pour gérer l'interface utilisateur du timer Pomodoro
class TimerViewController: UIViewController {
    
    /// Label pour afficher le statut actuel (Focus, Break, etc.)
    @IBOutlet weak var Statut: UILabel!
    
    /// ImageView pour le premier indicateur de progression
    @IBOutlet weak var prog4: UIImageView!
    
    /// ImageView pour le deuxième indicateur de progression
    @IBOutlet weak var prog3: UIImageView!
    
    /// ImageView pour le troisième indicateur de progression
    @IBOutlet weak var prog2: UIImageView!
    
    /// ImageView pour le quatrième indicateur de progression
    @IBOutlet weak var prog1: UIImageView!
    
    /// Instance de TimerPomodoro contenant les paramètres du timer
    var chrono: TimerPomodoro = TimerPomodoro(focusTime: Int(), shortBreak: Int(), longBreak: Int())
    
    /// Méthode appelée après le chargement de la vue
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialisation supplémentaire après le chargement de la vue
    }
}

