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
        HStack(spacing: 210) {
            Text(titreObj)
                .font(.largeTitle)
            
            Image(systemName:icon)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    GoalRowView(titreObj: "Anglais", icon: "circle.badge.checkmark.fill")
}
