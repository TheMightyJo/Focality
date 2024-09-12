//
//  UserViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import SwiftUI

/// La classe UserViewModel gère une collection d'utilisateurs et permet l'ajout de nouveaux utilisateurs.
/// Elle implémente le protocole ObservableObject ce qui signifie que les changements d'état dans cette classe peuvent être observés par des vues SwiftUI..
class UserViewModel: ObservableObject{
/// users est un objets User. Cette propriété est observable et toute modification entraînera une mise à jour de l'interface utilisateur.
    @Published var users: [User] = []

   private let baseURL = "http://10.80.55.104:3000/User"
    
    func fetchUser() {
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedUsers = try JSONDecoder().decode([User].self,from: data)
                    DispatchQueue.main.async {
                        self.users = decodedUsers
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
                
            } else if let error = error {
                print("error fetching data: \(error)")
            }
            
        }.resume()
    }
    
    func addUser(_ user: User) {
            guard let url = URL(string: baseURL) else {
                print("Invalid URL")
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            do {
                let data = try JSONEncoder().encode(user)
                request.httpBody = data
            } catch {
                print("Error encoding contact: \(error)")
                return
            }

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error adding contact: \(error)")
                    return
                }
                self.fetchUser()
            }.resume()
        }
    
   
    
    
    
}
