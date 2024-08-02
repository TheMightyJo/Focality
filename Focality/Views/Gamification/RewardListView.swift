//
//  RewardListView.swift
//  Focality
//
//  Created by Johan Quille on 20/07/2024.
//

import SwiftUI

struct RewardListView: View {
    @ObservedObject var rewardViewModel: RewardViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                Spacer()
                Image("ProfilePicture")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            VStack {
                HStack {
                    Image("Medal")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                    VStack {
                        Text("\(rewardViewModel.user?.point ?? 0)")
                            .foregroundStyle(.accent)
                            .font(.system(size: 50)).bold()
                        Text("Points")
                            .foregroundStyle(.secondaire).bold()
                    }
                }
                
                
            }
            ForEach(rewardViewModel.rewards) { reward in
                RewardRowView(reward: reward)
                    .padding(.bottom, 10)
            }
        }
        .padding()
    }
}

struct RewardListView_Previews: PreviewProvider {
    static var previews: some View {
        RewardListView(rewardViewModel: RewardViewModel(userViewModel: UserViewModel()))
    }
}
