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
//                        HStack {
//                        Image(systemName: "circle.badge.checkmark.fill")
//                                .resizable()
//                                .frame(width:35, height: 30)
//                                .foregroundStyle(.blue)
//                        VStack(alignment: .leading) {
//                            Text(GoalDetailView).font(.headline)
//                            HStack{
//                        Text(GoalDetailView.startDate, style: .date).font(.caption)
//                                Text("-")
//                        Text(GoalDetailView.endDate, style: .date).font(.caption)
//                            }
//                        }
//        
//                        }
    }
}

#Preview {
    GoalRowView(titreObj: "Anglais", icon: "circle.badge.checkmark.fill")
}
