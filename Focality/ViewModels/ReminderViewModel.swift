//
//  ReminderViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import Foundation

class ReminderViewModel: ObservableObject {
    @Published var rappels: [Reminder]

    init(rappels: [Reminder] = []) {
        self.rappels = rappels
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
        rappels.remove(atOffsets: offsets)
    }



    var completedRappels: [Reminder] {
        rappels.filter { $0.isCompleted }
    }
    func fetchReminder() {
        guard let url = URL(string: "http://localhost:3000/Reminder") else {
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
    
    
    
}





