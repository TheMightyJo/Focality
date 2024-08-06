//
//  ListGoalView.swift
//  Focality
//
//  Created by Apprenant 165 on 06/08/2024.
//

import SwiftUI

struct ListGoalView: View {
    @StateObject private var viewModel = GoalViewModel()
    @State private var showAddGoal = false
    
    var body: some View {
       
        NavigationView {
        
            VStack {
                HStack(spacing: 140) {
                    Text("Objectifs").font(.largeTitle)
                    Button(action: {
                        showAddGoal.toggle()
                    }) {
                        Text("+")
                            .font(.largeTitle)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .clipShape(Circle())
                    }
                    .padding()
                    .sheet(isPresented: $showAddGoal) {
                        AddGoal(viewModel: viewModel)
                    }
                }
                VStack {
                    NavigationLink(destination: ListGoal(viewModel: viewModel, filter: .aCompleter)) {
                        Rectangle()
                            .fill(Color.red)
                            .frame(height: 100)
                            .overlay(Text("A completer").foregroundColor(.white))
                            .font(.title)
                            .cornerRadius(10)
                            .padding()
                    }
                    NavigationLink(destination: ListGoal(viewModel: viewModel, filter: .all)) {
                        Rectangle()
                            .fill(Color.orange)
                            .frame(height: 100)
                            .overlay(Text("Tous").foregroundColor(.white))
                            .font(.title)
                            .cornerRadius(10)
                            .padding()
                    }
                    NavigationLink(destination: ListGoal(viewModel: viewModel, filter: .completer)) {
                        Rectangle()
                            .fill(Color.green)
                            .frame(height: 100)
                            .overlay(Text("Terminé").foregroundColor(.white))
                            .font(.title)
                            .cornerRadius(10)
                            .padding()
                    }
                }
                Image("Logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                Spacer()
            }
                
            }
        }
    }


struct ListGoalView_Previews: PreviewProvider {
    static var previews: some View {
      ListGoalView()
    }
}

