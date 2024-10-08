import SwiftUI

struct GamificationCardView: View {
    @ObservedObject var rewardViewModel: RewardViewModel
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            if let nextReward = rewardViewModel.rewards.first(where: { !$0.isUnlocked }) {
                VStack(alignment: .leading, spacing: 10.0) {
                    Text("Prochaine Récompense")
                        .font(.headline)
                    Text(nextReward.title)
                        .font(.title2)
                        .foregroundStyle(.accent)
                    Text("Points requis : \(nextReward.requiredPoints)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.secondaire)
                .cornerRadius(10)
            } else {
                Text("Toutes les récompenses sont débloquées!")
                    .font(.headline)
                    .foregroundColor(.green)
            }
        }
        .padding()
        .foregroundColor(.white)
        .cornerRadius(10)
        
        
    }
}

struct GamificationCardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GamificationCardView(
                rewardViewModel: RewardViewModel(userViewModel: UserViewModel()),
                userViewModel: UserViewModel()
            )
            .previewLayout(.sizeThatFits)
            .padding()
        }
    }
}
