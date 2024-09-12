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
                
                Reminderrr()
                
                VStack {
                    NavigationLink(destination: ReminderListView(viewModel: viewModel, filter: .all)) {
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
            .onAppear{
                viewModel.fetchReminder()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}

struct Reminderrr: UIViewControllerRepresentable{

    func makeUIViewController(context: Context) -> some ReminderViewController {
        let storyboard = UIStoryboard(name: "MainReminder", bundle: .main)
        guard let reminderVC = storyboard.instantiateViewController(identifier: "ReminderViewController") as? ReminderViewController else {
            fatalError("cannot instanciate ReminderViewController")
        }
        return reminderVC
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
