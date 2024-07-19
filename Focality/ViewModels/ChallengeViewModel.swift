import Foundation
import Combine

/// ViewModel pour gérer la logique des challenges.
///
/// Le ViewModel utilise `@Published` pour rendre les propriétés réactives, ce qui permet
/// aux vues SwiftUI de se mettre à jour automatiquement en réponse aux changements de données.
class ChallengeViewModel: ObservableObject {
    /// Liste des challenges.
    @Published var challenges: [Challenge] = []
    
    /// Message d'erreur optionnel.
    @Published var errorMessage: String? = nil

    /// Initialiseur pour charger les challenges initiaux.
    init() {
        loadChallenges()
    }

    /// Charge les challenges initiaux.
    ///
    /// Cette méthode simule le chargement des challenges.
    func loadChallenges() {
        challenges = [
            Challenge(title: "Terminer une séance de respiration/expiration", description: "Compléter une séance de respiration/expiration de 5 minutes."),
            Challenge(title: "Terminer un timer", description: "Compléter un cycle de travail de 25 minutes avec le timer Pomodoro."),
            Challenge(title: "Atteindre un objectif donné", description: "Compléter tous les objectifs de la semaine.")
        ]
    }
}
