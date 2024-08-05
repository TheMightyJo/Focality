//
//  GoalRowView.swift
//  Focality
//
//  Created by Apprenant 165 on 01/08/2024.
//

import SwiftUI

struct GoalRowView: View {
    let titreObj: String
    let icon: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName:icon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundStyle(.blue)
            
            Text(titreObj)
                .font(.largeTitle)

        }
    }
}

#Preview {
    GoalRowView(titreObj: "Anglais", icon: "circle.badge.checkmark.fill")
}
