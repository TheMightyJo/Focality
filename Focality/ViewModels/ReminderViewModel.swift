//
//  ReminderViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import Foundation

class ReminderViewModel: ObservableObject {
    @Published var rappels: [Reminder]
    @Published var dateFormat: DateFormatterToFR?
    @Published var errorDate: String? = nil
    
    init(rappels: [Reminder] = [], dateFormat: DateFormatterToFR) {
        self.rappels = rappels
        self.dateFormat = dateFormat
    }
    
    func addRappel(titre: String, description: String, date: String) {
        let newRappel = Reminder(titre: titre, description: description, date: date)
        rappels.append(newRappel)
    }
    
    func markAsCompleted(rappel: Reminder) {
        if let index = rappels.firstIndex(where: { $0.id == rappel.id }) {
            rappels[index].isCompleted = true
        }
    }
    func removeRappel(at offsets: IndexSet) {
        for index in offsets {
            let rappel = rappels[index]
            deleteReminder(rappel) // Supprimer de l'API
            rappels.remove(at: index) // Supprimer localement
        }
    }
    
    var completedRappels: [Reminder] {
        rappels.filter { $0.isCompleted }
    }
    
    private let baseURL = "http://localhost:3000/Reminder"
    
    func fetchReminder() {
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([Reminder].self, from: data)
                    DispatchQueue.main.async{
                        self.rappels = decodedData
                    }
                    
                } catch {
                    print("Error decoding data: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
    
    func addReminder(_ rappel: Reminder) {
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            let data = try JSONEncoder().encode(rappel)
            request.httpBody = data
        } catch {
            print("Error encoding contact: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error updating contact: \(error)")
                return
            }
            self.fetchReminder()
        }.resume()
    }
    
    func deleteReminder(_ rappel: Reminder) {
        guard let url = URL(string: "\(baseURL)/\(rappel.id)") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error deleting reminder: \(error)")
                return
            }
            DispatchQueue.main.async {
                self.fetchReminder() // Recharger les rappels après suppression
            }
            
        }.resume()
    }
}





