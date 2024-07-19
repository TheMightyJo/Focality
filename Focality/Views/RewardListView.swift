import SwiftUI

struct RewardListView: View {
    @ObservedObject var viewModel: RewardViewModel
    @State private var points: Int = 0

    var body: some View {
        VStack {
            HStack {
                Text("Current Points: \(points)")
                Button(action: {
                    points += 50
                    viewModel.unlockRewardIfNeeded(points: points)
                }) {
                    Text("Add 50 Points")
                }
            }
            List(viewModel.rewards) { reward in
                RewardRowView(reward: reward)
            }
        }
        .padding()
        .onAppear {
            viewModel.loadRewards()
        }
    }
}

struct RewardRowView: View {
    let reward: Reward

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(reward.title)
                    .font(.headline)
                Text(reward.description)
                    .font(.subheadline)
                Text("Points required: \(reward.requiredPoints)")
                    .font(.footnote)
            }
            Spacer()
            if reward.isUnlocked {
                Text("Unlocked")
                    .foregroundColor(.green)
            } else {
                Text("Locked")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .border(reward.isUnlocked ? Color.green : Color.red, width: 2)
    }
}

struct RewardListView_Previews: PreviewProvider {
    static var previews: some View {
        RewardListView(viewModel: RewardViewModel())
    }
}
