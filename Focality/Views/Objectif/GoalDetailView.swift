//
//  GoalDetailView.swift
//  Focality
//
//  Created by Apprenant 165 on 01/08/2024.
//

import SwiftUI

struct GoalDetailView: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
    
//    var goals: Goal
    
    func makeUIViewController(context: Context) -> some GoalViewController {
        let storyboard = UIStoryboard(name: "MainGoal", bundle: .main)
        
        guard let goalVC = storyboard.instantiateViewController(withIdentifier: "GoalView") as? GoalViewController else {
            fatalError("Cannot instanciate")
        }
        
//        goalVC.objectif = goals
        
        return goalVC
    }
}
