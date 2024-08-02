//
//  RewardRowView.swift
//  Focality
//
//  Created by Johan Quille on 20/07/2024.
//

import SwiftUI

struct RewardRowView: View {
    let reward: Reward

    var body: some View {
        VStack(alignment: .leading) {
            Text(reward.title)
                .font(.headline)
            Text(reward.description)
                .font(.subheadline)
            Text("Points requis : \(reward.requiredPoints)")
                .font(.footnote)
            if reward.isUnlocked {
                Text("Récompense débloquée")
                    .foregroundColor(.green)
            } else {
                Text("Récompense verrouillée")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct RewardRowView_Previews: PreviewProvider {
    static var previews: some View {
        RewardRowView(reward: Reward(title: "Bon d'achat Amazon", description: "Un bon d'achat de 10€ sur Amazon.", requiredPoints: 100))
    }
}
