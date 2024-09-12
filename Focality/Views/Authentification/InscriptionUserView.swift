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
    @State private var passwordConfirmation = ""
    @State private var birthDate = Date()
    
    var body: some View {
        NavigationStack {
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100)
            Form {
                Section(header: Text("Prénom")) {
                    TextField("", text: $firstName)
                }
                Section(header: Text("Nom")) {
                    TextField("", text: $lastName)
                }
                Section(header: Text("Email")) {
                    TextField("", text: $email)
                        .textInputAutocapitalization(.never)
                }
                Section(header: Text("Mot de passe")) {
                    SecureField("", text: $password)
                        .textInputAutocapitalization(.never)
                }
                Section(header: Text("Confirmer votre Mot de passe")) {
                    SecureField("", text: $passwordConfirmation)
                        .textInputAutocapitalization(.never)
                }
                Section(header: Text("Date de naisssance")) {
                    DatePicker("Choisir une date", selection: $birthDate,displayedComponents: .date)
                }
                
            }
            .font(.system(size: 15))
            .foregroundColor(.secondaire)
            .tint(.primaire).bold()
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .navigationTitle("Inscription")
            .scrollContentBackground(.hidden)
            
            
            Button(action: {
                let newUser = User(id: UUID().uuidString, firstName: firstName, lastName: lastName, email: email, password: password, birthDate: Date(), points: 0, currentLevel: 0)
                userViewModel.addUser(newUser)
                presentationMode.wrappedValue.dismiss()
            }) {
                NavigationLink(destination: ContentView(authViewModel: AuthViewModel(userViewModel: UserViewModel()))){
                    Text("Continuer")
                }
                
            }
            .foregroundColor(.white).bold()
            .padding()
            .background(.secondaire)
            .cornerRadius(10)
        }
    }
}

#Preview {
    InscriptionUserView(userViewModel: UserViewModel())
}
