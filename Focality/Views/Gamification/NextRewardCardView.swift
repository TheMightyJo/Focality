//
//  NextRewardCardView.swift
//  Focality
//
//  Created by Johan Quille on 20/07/2024.
//

import SwiftUI

struct NextRewardCardView: View {
    let reward: Reward
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Prochaine Récompense")
                .textCase(.uppercase)
                .font(.headline).bold()
                .padding(.bottom, 5)
            Text(reward.title)
                .font(.title2)
            Text(reward.description)
                .font(.body)
            CustomButton(title: "\(reward.requiredPoints) points", backgroundColor: .accentColor) {
                
            }
        }
        .padding()
        .foregroundStyle(.white)
        .background(Color(.secondaire))
        .cornerRadius(20)
        
        
        .padding()
    }
}

struct NextRewardCardView_Previews: PreviewProvider {
    static var previews: some View {
        NextRewardCardView(reward: Reward(title: "Bon d'achat Amazon", description: "Un bon d'achat de 10€ sur Amazon.", requiredPoints: 100))
    }
}
