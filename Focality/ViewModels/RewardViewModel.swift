import Foundation
import Combine

class RewardViewModel: ObservableObject {
    // Liste des récompenses
    @Published var rewards: [Reward] = []
    // Message d'erreur optionnel
    @Published var errorMessage: String? = nil

    // Initialiseur pour charger les récompenses initiales
    init() {
        loadRewards()
    }

    // Charger des récompenses initiales (simulation)
    func loadRewards() {
        // Simulation de récompenses
        rewards = [
            Reward(title: "First Reward", description: "This is the first reward.", requiredPoints: 100),
            Reward(title: "Second Reward", description: "This is the second reward.", requiredPoints: 200)
        ]
    }

    // Méthode pour débloquer une récompense si les points requis sont atteints
    func unlockRewardIfNeeded(points: Int) {
        for i in 0..<rewards.count {
            if points >= rewards[i].requiredPoints && !rewards[i].isUnlocked {
                rewards[i].isUnlocked = true
                print("Reward unlocked: \(rewards[i].title)")
            }
        }
    }

    // Méthode pour ajouter une nouvelle récompense
    func addReward(title: String, description: String, requiredPoints: Int) {
        let newReward = Reward(title: title, description: description, requiredPoints: requiredPoints)
        rewards.append(newReward)
    }
}
