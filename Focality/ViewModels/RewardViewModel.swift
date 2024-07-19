import Foundation
import Combine

/// ViewModel pour gérer la logique des récompenses et des utilisateurs.
///
/// Le ViewModel utilise `@Published` pour rendre les propriétés réactives, ce qui permet
/// aux vues SwiftUI de se mettre à jour automatiquement en réponse aux changements de données.
class RewardViewModel: ObservableObject {
    /// Liste des récompenses.
    @Published var rewards: [Reward] = []
    
    /// Liste des challenges.
    @Published var challenges: [Challenge] = []
    
    /// Utilisateur actuel.
    @Published var user: User?
    
    /// Initialiseur pour charger les récompenses et les challenges initiaux.
    init() {
        loadRewards()
    }
    
    /// Charge les récompenses initiales.
    ///
    /// Cette méthode simule le chargement des récompenses.
    func loadRewards() {
        // Simulation de récompenses
        rewards = [
            Reward(title: "Bon d'achat Amazon", description: "Un bon d'achat de 10€ sur Amazon.", requiredPoints: 100),
            Reward(title: "Abonnement Spotify", description: "Un mois d'abonnement gratuit à Spotify Premium.", requiredPoints: 200),
            Reward(title: "Réduction chez McDonald's", description: "Une réduction de 5€ chez McDonald's.", requiredPoints: 150),
            Reward(title: "Bon d'achat Fnac", description: "Un bon d'achat de 15€ à la Fnac.", requiredPoints: 300),
            Reward(title: "Carte cadeau Starbucks", description: "Une carte cadeau de 10€ chez Starbucks.", requiredPoints: 250),
            Reward(title: "Cours en ligne Udemy", description: "Un cours gratuit sur Udemy.", requiredPoints: 400),
            Reward(title: "Réduction sur les livres", description: "Une réduction de 20% sur les livres chez un libraire local.", requiredPoints: 180),
            Reward(title: "Bon plan cinéma", description: "Un ticket de cinéma gratuit.", requiredPoints: 220),
            Reward(title: "Abonnement Netflix", description: "Un mois d'abonnement gratuit à Netflix.", requiredPoints: 500),
            Reward(title: "Réduction sur les vêtements", description: "Une réduction de 10€ sur l'achat de vêtements.", requiredPoints: 350)
        ]
    }
}
