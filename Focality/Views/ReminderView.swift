//
//  ReminderView.swift
//  Focality
//
//  Created by Apprenant 178 on 30/07/2024.
//

import SwiftUI

struct ReminderView: View {
    @StateObject private var viewModel = ReminderViewModel()
    @State private var showingAddRappelView = false

    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("Rappels")
                        .bold()
                        .font(.system(size: 40))
                        .padding(.trailing, 100)
                        
                        
                    
                    Image("Logo")
                        .resizable()
                            .frame(width: 120.0, height: 120.0)
                            
                }
                VStack {
                    NavigationLink(destination: ReminderListView(viewModel: viewModel, filter: .today)) {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 100)
                            .overlay(Text("AUJOURD'HUI").foregroundColor(.white))
                            .cornerRadius(10)
                            .padding()
                        
                    }
                    NavigationLink(destination: ReminderListView(viewModel: viewModel, filter: .all)) {
                        Rectangle()
                            .fill(Color.green)
                            .frame(height: 100)
                            .overlay(Text("TOUS").foregroundColor(.white))
                            .cornerRadius(10)
                            .padding()
                    }
                    NavigationLink(destination: ReminderListView(viewModel: viewModel, filter: .completed)) {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 100)
                            .overlay(Text("TERMINÉ").foregroundColor(.white))
                            .cornerRadius(10)
                            .padding()
                    }
                }
                Button(action: {
                    showingAddRappelView.toggle()
                }) {
                    Text("+")
                        .font(.system(size: 100))
                        .frame(width: 110, height: 110)
                        .padding(.bottom)
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .clipShape(Circle())
                }
                .padding()
                .sheet(isPresented: $showingAddRappelView) {
                    AddReminderView(viewModel: viewModel)
                }
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
