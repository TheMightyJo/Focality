import SwiftUI

///La vue InscriptionUserView permet aux utilisateurs de s'inscrire en entrant leurs informations personnelles.
/// Elle utilise le modèle de vue UserViewModel pour gérer les données utilisateur.
struct InscriptionUserView: View {
/// Le modèle de vue utilisé pour gérer les utilisateurs.
    @ObservedObject var userViewModel: UserViewModel
/// Le modèle de vue utilisé pour gérer l'authentification
    @ObservedObject var authViewModel: AuthViewModel
/// Propriétés d'état pour stocker les entrées utilisateur.
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var birthday = Date()
    @State private var navigateToContentView = false

    var body: some View {
        VStack {
/// Titre de l'inscription.
            Text("Inscription")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding(.trailing, 200)
/// Logo de l'application.
<<<<<<< Updated upstream
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100)

            List {
/// Champ de texte pour le prénom.
                HStack {
=======
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
            List{
    /// Champ de texte pour le prénom.
                HStack{
>>>>>>> Stashed changes
                    Text("FirstName")
                    TextField("FirstName", text: $firstName)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
<<<<<<< Updated upstream
/// Champ de texte pour le nom de famille.
                HStack {
=======
    /// Champ de texte pour le nom de famille.
                HStack{
>>>>>>> Stashed changes
                    Text("LastName")
                    TextField("LasttName", text: $lastName)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
<<<<<<< Updated upstream
/// Champ de texte pour l'email.
                HStack {
=======
               
/// Champ de texte pour l'email.
                HStack{
>>>>>>> Stashed changes
                    Text("Email")
                    TextField("Email", text: $email)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
/// Champ de texte pour le mot de passe.
<<<<<<< Updated upstream
                HStack {
=======
                HStack{
>>>>>>> Stashed changes
                    Text("Password")
                    SecureField("Password", text: $password)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
/// Sélecteur de date pour la date de naissance.
<<<<<<< Updated upstream
                HStack {
=======
                HStack{
                    
>>>>>>> Stashed changes
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
<<<<<<< Updated upstream
/// Bouton pour créer un utilisateur.
                ZStack {
=======
                
//                HStack{
//                    Text("Points")
//                    TextField("Points", value: $point, formatter: NumberFormatter())
//                    .keyboardType(.numberPad)
//                    .padding()
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//               
//                HStack{
//                    Text("Current Level")
//                    TextField("Current Level", value: $currentLevel, formatter: NumberFormatter())
//                    .keyboardType(.numberPad)
//                    .padding()
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//                
/// Bouton pour créer un utilisateur.
                ZStack{
>>>>>>> Stashed changes
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaire)
                        .frame(width: 300, height: 50)
                    Button(action: {
                        authViewModel.firstName = firstName
                        authViewModel.lastName = lastName
                        authViewModel.email = email
                        authViewModel.password = password
                        authViewModel.birthday = birthday
                        authViewModel.signUp()
                        if authViewModel.isSignUpSuccess {
                            navigateToContentView = true
                        }
                    }, label: {
                        Text("Création")
                    })
                    .foregroundColor(.black)
                    .font(.custom("arial", size: 30))
                }
            }
            .scrollContentBackground(.hidden)
            
            NavigationLink(destination: ContentView(authViewModel: authViewModel), isActive: $navigateToContentView) {
                EmptyView()
            }
        }
    }
}

#Preview {
    InscriptionUserView(userViewModel: UserViewModel(), authViewModel: AuthViewModel(userViewModel: UserViewModel()))
}
