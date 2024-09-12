//
//  GamificationProfileView.swift
//  Focality
//
//  Created by Johan Quille on 20/07/2024.
//

import SwiftUI

struct GamificationProfileView: View {
    @ObservedObject var rewardViewModel: RewardViewModel
    @ObservedObject var challengeViewModel: ChallengeViewModel
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                    Image("ProfilePicture")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                HStack {
                    Image("Medal")
                        .resizable()
                        .frame(width: 70, height: 70)
                    VStack {
                        Text("\(rewardViewModel.user?.points ?? 0)")
                            .foregroundStyle(.accent)
                            .font(.system(size: 50)).bold()
                        Text("Points")
                            .foregroundStyle(.secondaire).bold()
                    }
                }
                if let nextReward = rewardViewModel.rewards.first(where: { !$0.isUnlocked }) {
                    NextRewardCardView(reward: nextReward)
                }
                
                Text("Gagner plus de points")
                    .font(.system(size: 20)).bold()
                
                VStack(alignment: .leading) {
                    ForEach(challengeViewModel.challenges.filter { !$0.isCompleted }) { challenge in
                        ChallengeRowView(userViewModel: userViewModel, challenge: challenge)
                            .padding(.bottom, 10)
                    }
                }
            }
            .padding()
        }
    }
}

struct GamificationProfileView_Previews: PreviewProvider {
    static var previews: some View {
        GamificationProfileView(
            rewardViewModel: RewardViewModel(userViewModel: UserViewModel()),
            challengeViewModel: ChallengeViewModel(),
            userViewModel: UserViewModel()
        )
    }
}
