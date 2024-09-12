import SwiftUI

/// La vue InscriptionUserView permet aux utilisateurs de s'inscrire en entrant leurs informations personnelles.
/// Elle utilise le modèle de vue UserViewModel pour gérer les données utilisateur.
struct InscriptionUserView: View {
    @Environment(\.presentationMode) var presentationMode
    /// Le modèle de vue utilisé pour gérer les utilisateurs.
    @ObservedObject var userViewModel: UserViewModel
    /// Le modèle de vue utilisé pour gérer l'authentification.
//    @ObservedObject var authViewModel: AuthViewModel
    /// Propriétés d'état pour stocker les entrées utilisateur.
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var birthDate = ""
//  @State private var currentLevel = ""
//    @State private var points = ""
   
    var body: some View {
        NavigationView {
            
            VStack {
               
                
                /// Logo de l'application.
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Form {
                    /// Champ de texte pour le prénom.
                    HStack {
                        Text("Prenom")
                        TextField("FirstName", text: $firstName)
                            
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    /// Champ de texte pour le nom de famille.
                    HStack {
                        Text("Nom")
                        TextField("LastName", text: $lastName)
                          
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    /// Champ de texte pour l'email.
                    HStack {
                        Text("Email")
                        TextField("Email", text: $email)
                           
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    /// Champ de texte pour le mot de passe.
                    HStack {
                        Text("Mot de passe")
                        SecureField("Password", text: $password)
                           
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    /// Sélecteur de date pour la date de naissance.
                    HStack {
                       Text("Date de naissance")
                        TextField("Date de naissance", text: $birthDate)
                          
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }.listRowSpacing(30.0)
                .navigationTitle("Inscription")
                .scrollContentBackground(.hidden)
                .navigationBarItems(trailing: Button(action: {
                    let newUser = User(id: UUID().uuidString, firstName: firstName, lastName: lastName, email: email, password: password, birthDate: birthDate, points: 0, currentLevel: 0)
                    userViewModel.addUser(newUser)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                })
              
                
            }
        }
    }
}

#Preview {
    InscriptionUserView(userViewModel: UserViewModel())
}
