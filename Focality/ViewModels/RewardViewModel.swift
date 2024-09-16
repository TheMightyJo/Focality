import Foundation
import Combine

/// ViewModel pour gérer la logique des récompenses et des utilisateurs.
///
/// Le ViewModel utilise `@Published` pour rendre les propriétés réactives, ce qui permet
/// aux vues SwiftUI de se mettre à jour automatiquement en réponse aux changements de données.
class RewardViewModel: ObservableObject {
    /// Liste des récompenses.
    @Published var rewards: [Reward] = []
    
    /// Utilisateur actuel.
    @Published var user: User?
    
    /// Message d'erreur optionnel.
    @Published var errorMessage: String? = nil

    /// Initialiseur pour charger les récompenses et l'utilisateur initial.
    init(userViewModel: UserViewModel) {
        loadRewards()
        loadUser(from: userViewModel)
    }

    /// Charge les récompenses initiales.
    ///
    /// Cette méthode simule le chargement des récompenses.
    func loadRewards() {
        rewards = [
            Reward(title: "Bon d'achat Amazon", description: "Un bon d'achat de 10€ sur Amazon.", requiredPoints: 100),
            Reward(title: "Abonnement Spotify", description: "Un mois d'abonnement gratuit à Spotify Premium.", requiredPoints: 200),
            Reward(title: "Réduction chez McDonald's", description: "Une réduction de 5€ chez McDonald's.", requiredPoints: 150),
        ]
    }
    
    /// Charge les informations de l'utilisateur à partir de UserViewModel.
    ///
    /// - Parameter userViewModel: Le UserViewModel contenant les informations utilisateur.
    func loadUser(from userViewModel: UserViewModel) {
        if let lastUser = userViewModel.users.last {
            self.user = lastUser
        }
    }

    /// Débloque les récompenses si les points requis sont atteints.
    ///
    /// - Parameter points: Le nombre de points de l'utilisateur.
    func unlockRewardIfNeeded(points: Int) {
        for i in 0..<rewards.count {
            if points >= rewards[i].requiredPoints && !rewards[i].isUnlocked {
                rewards[i].isUnlocked = true
                print("Récompense débloquée : \(rewards[i].title)")
            }
        }
    }
  
    /// Ajoute une nouvelle récompense.
    ///
    /// - Parameters:
    ///   - title: Le titre de la récompense.
    ///   - description: La description de la récompense.
    ///   - requiredPoints: Le nombre de points requis pour déverrouiller la récompense.
    func addReward(title: String, description: String, requiredPoints: Int) {
        let newReward = Reward(title: title, description: description, requiredPoints: requiredPoints)
        rewards.append(newReward)
    }
}
