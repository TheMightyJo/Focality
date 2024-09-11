import SwiftUI

/// La vue InscriptionUserView permet aux utilisateurs de s'inscrire en entrant leurs informations personnelles.
/// Elle utilise le modèle de vue UserViewModel pour gérer les données utilisateur.
struct InscriptionUserView: View {
    /// Le modèle de vue utilisé pour gérer les utilisateurs.
    @ObservedObject var userViewModel: UserViewModel
    /// Le modèle de vue utilisé pour gérer l'authentification.
    @ObservedObject var authViewModel: AuthViewModel
    /// Propriétés d'état pour stocker les entrées utilisateur.
    @State private var firstName = "Emiliano"
    @State private var lastName = "Babar"
    @State private var email = "emiliano@gmail.com"
    @State private var password = "Teamcook5*"
    @State private var birthday = Date()
    @State private var navigateToContentView = false
    
    var body: some View {
        NavigationView {
            
        
            VStack {
               
                
                /// Logo de l'application.
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                List {
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
                        DatePicker("Date de naissance", selection: $birthday, displayedComponents: .date)
                          
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    /// Bouton pour créer un utilisateur.
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.primaire)
                            .frame(width: 300, height: 50)
                        
                        Button(action: {
                            /// Mise à jour des informations utilisateur dans le ViewModel d'authentification.
                            authViewModel.firstName = firstName
                            authViewModel.lastName = lastName
                            authViewModel.email = email
                            authViewModel.password = password
                            authViewModel.birthday = birthday
                            authViewModel.signUp()
                            
                            /// Si l'inscription réussit, navigation vers la vue principale.
                            if authViewModel.isSignUpSuccess {
                                navigateToContentView = true
                            }
                        }, label: {
                            Text("Création")
                        })
                        .foregroundColor(.black)
                        .font(.custom("arial", size: 30))
                    }
                }.listRowSpacing(30.0)
              
                .navigationTitle("Inscription")
                .scrollContentBackground(.hidden)
                
                
                /// Navigation vers ContentView si l'inscription est réussie.
                NavigationLink(destination: ContentView(authViewModel: authViewModel)
                    .navigationBarBackButtonHidden(true),
                               isActive: $navigateToContentView) {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    InscriptionUserView(userViewModel: UserViewModel(), authViewModel: AuthViewModel(userViewModel: UserViewModel()))
}
