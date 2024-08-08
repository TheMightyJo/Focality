import SwiftUI

///La vue InscriptionUserView permet aux utilisateurs de s'inscrire en entrant leurs informations personnelles.
/// Elle utilise le modèle de vue UserViewModel pour gérer les données utilisateur.
struct InscriptionUserView: View {
/// Le modèle de vue utilisé pour gérer les utilisateurs.
    @ObservedObject var userViewModel: UserViewModel
/// Le modèle de vue utilisé pour gérer l'authentification
    @ObservedObject var authViewModel: AuthViewModel
<<<<<<< Updated upstream
/// Propriétés d'état pour stocker les entrées utilisateur.
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
=======
    @State private var firstName = "Emiliano"
    @State private var lastName = "Babar"
    @State private var email = "emiliano@gmail.com"
    @State private var password = "Teamcook5*"
>>>>>>> Stashed changes
    @State private var birthday = Date()
    @State private var selectedImage: UIImage? = UIImage(named: "ProfilePicture") // Image par défaut d'Emiliano
    @State private var isImagePickerPresented = false
    @State private var navigateToContentView = false
    
    var body: some View {
        VStack {
/// Titre de l'inscription.
            Text("Inscription")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding(.trailing, 200)
<<<<<<< Updated upstream
/// Logo de l'application.
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100)

=======
            
            Button(action: {
                isImagePickerPresented = true
            }) {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
>>>>>>> Stashed changes
            List {
/// Champ de texte pour le prénom.
                HStack {
                    Text("FirstName")
                    TextField("FirstName", text: $firstName)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
<<<<<<< Updated upstream
/// Champ de texte pour le nom de famille.
=======
                
>>>>>>> Stashed changes
                HStack {
                    Text("LastName")
                    TextField("LastName", text: $lastName)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
<<<<<<< Updated upstream
/// Champ de texte pour l'email.
=======
                
>>>>>>> Stashed changes
                HStack {
                    Text("Email")
                    TextField("Email", text: $email)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
<<<<<<< Updated upstream
/// Champ de texte pour le mot de passe.
=======
                
>>>>>>> Stashed changes
                HStack {
                    Text("Password")
                    SecureField("Password", text: $password)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
<<<<<<< Updated upstream
/// Sélecteur de date pour la date de naissance.
=======
                
>>>>>>> Stashed changes
                HStack {
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
<<<<<<< Updated upstream
/// Bouton pour créer un utilisateur.
=======
                
>>>>>>> Stashed changes
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaire)
                        .frame(width: 300, height: 50)
                    Button(action: {
                        authViewModel.firstName = firstName
                        authViewModel.lastName = lastName
                        authViewModel.email = email
                        authViewModel.password = password
                        authViewModel.birthday = birthday
                        authViewModel.selectedImage = selectedImage
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
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}

#Preview {
    InscriptionUserView(userViewModel: UserViewModel(), authViewModel: AuthViewModel(userViewModel: UserViewModel()))
}
