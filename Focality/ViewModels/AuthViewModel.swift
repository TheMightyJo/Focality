import Foundation
import Combine

/// ViewModel pour gérer la logique d'authentification.
///
/// Le ViewModel utilise `@Published` pour rendre les propriétés réactives, ce qui permet
/// aux vues SwiftUI de se mettre à jour automatiquement en réponse aux changements de données.
class AuthViewModel: ObservableObject {
    /// L'email de l'utilisateur.
    @Published var email: String
    
    /// Le mot de passe de l'utilisateur.
    @Published var password: String
    
    /// Le prénom de l'utilisateur.
    @Published var firstName: String = ""
    
    /// Le nom de famille de l'utilisateur.
    @Published var lastName: String = ""
    
    /// La date de naissance de l'utilisateur.
    @Published var birthday: Date = Date()
    
    /// Indique si l'utilisateur est authentifié.
    @Published var isAuthenticated: Bool = false
    
    /// Message d'erreur optionnel.
    @Published var errorMessage: String? = nil
    
    /// Message de réinitialisation de mot de passe optionnel.
    @Published var resetPasswordMessage: String? = nil
    
    /// Indique si l'inscription a été réussie.
    @Published var isSignUpSuccess: Bool = false
    
    /// Indique si la connexion a été réussie.
    @Published var isSignInSuccess: Bool = false
    
    /// ViewModel pour gérer les utilisateurs.
    private var userViewModel: UserViewModel
    
    /// Initialise le ViewModel avec une instance de `UserViewModel`.
    ///
    /// - Parameters:
    ///   - userViewModel: Une instance de `UserViewModel` pour gérer les utilisateurs.
    ///   - email: Valeur par défaut pour l'email de l'utilisateur.
    ///   - password: Valeur par défaut pour le mot de passe de l'utilisateur.
    init(userViewModel: UserViewModel, email: String = "", password: String = "") {
        self.userViewModel = userViewModel
        self.email = email
        self.password = password
    }
    
    /// Tente de connecter l'utilisateur avec les informations fournies.
    ///
    /// Met à jour `isSignInSuccess` à `true` si les informations d'identification sont correctes,
    /// sinon met à jour `errorMessage` avec un message d'erreur.
    func signIn() {
        if userViewModel.users.first(where: { $0.email == email && $0.password == password }) != nil {
            isAuthenticated = true
            isSignInSuccess = true
            errorMessage = nil
        } else {
            errorMessage = "Email ou mot de passe invalide"
        }
    }
    
    /// Inscrit un nouvel utilisateur avec les informations fournies.
    ///
    /// Met à jour `isSignUpSuccess` à `true` si l'inscription est réussie,
    /// sinon met à jour `errorMessage` avec un message d'erreur.
    func signUp() {
        if !email.isEmpty && !password.isEmpty && password.count >= 8 {
            let newUser = User(firstName: firstName, lastName: lastName, email: email, password: password, birthday: birthday, point: 0, currentLevel: 0)
            userViewModel.users.append(newUser)
            isSignUpSuccess = true
            errorMessage = nil
        } else {
            errorMessage = "Veuillez remplir correctement tous les champs"
        }
    }
    
    /// Réinitialise le mot de passe de l'utilisateur avec l'email fourni.
    ///
    /// Met à jour `resetPasswordMessage` avec un message de succès si l'email est trouvé,
    /// sinon met à jour `errorMessage` avec un message d'erreur.
    func resetPassword() {
        if let user = userViewModel.users.first(where: { $0.email == email }) {
            resetPasswordMessage = "Un lien de réinitialisation de mot de passe a été envoyé à \(user.email)"
            errorMessage = nil
        } else {
            errorMessage = "Email non trouvé"
        }
    }
}
