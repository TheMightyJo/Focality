//
//  GoalView.swift
//  Focality
//
//  Created by Apprenant 165 on 29/07/2024.
//

import SwiftUI

struct GoalView: View {
    @StateObject var viewGoals = GoalViewModel(goals: [])
    
    var body: some View {
        HStack {
            Text("Objectifs")
                .font(.title)
            Spacer()
            Image(systemName: "plus.circle.fill")
                .font(.title)
        }
        List(viewGoals.goals) { goal in
            
        
            
        }
        
    }
}

#Preview {
    GoalView()
}
