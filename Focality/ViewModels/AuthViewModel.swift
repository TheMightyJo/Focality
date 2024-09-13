import Foundation
import Combine
import SwiftUI

/// ViewModel pour gérer la logique d'authentification.
///
/// Le ViewModel utilise `@Published` pour rendre les propriétés réactives, ce qui permet
/// aux vues SwiftUI de se mettre à jour automatiquement en réponse aux changements de données.
class AuthViewModel: ObservableObject {
    // MARK: - Published Properties
    
    /// L'email de l'utilisateur.
    @Published var email: String
    
    /// Le mot de passe de l'utilisateur.
    @Published var password: String
    
    /// Le prénom de l'utilisateur.
    @Published var firstName: String = ""
    
    /// Le nom de famille de l'utilisateur.
    @Published var lastName: String = ""
    
    /// La date de naissance de l'utilisateur.
    @Published var birthDate: Date = Date()
    
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
    
    /// Image sélectionnée pour l'utilisateur.
    @Published var selectedImage: UIImage? = nil
    
    
    
    // MARK: - Private Properties
    
    /// ViewModel pour gérer les utilisateurs.
    private var userViewModel: UserViewModel
    
    // MARK: - Constants
    
    private let minimumPasswordLength = 8
    private let emailErrorMessage = "Email ou mot de passe invalide"
    private let signUpErrorMessage = "Veuillez remplir correctement tous les champs"
    private let resetPasswordSuccessMessage = "Un lien de réinitialisation de mot de passe a été envoyé à"
    private let emailNotFoundMessage = "Email non trouvé"
    
    // MARK: - Initializer
    
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
    
    // MARK: - Methods
    
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
            errorMessage = emailErrorMessage
        }
    }
    
    /// Inscrit un nouvel utilisateur avec les informations fournies.
    ///
    /// Met à jour `isSignUpSuccess` à `true` si l'inscription est réussie,
    /// sinon met à jour `errorMessage` avec un message d'erreur.
//    func signUp() {
//        guard !email.isEmpty, !password.isEmpty, password.count >= minimumPasswordLength else {
//            errorMessage = signUpErrorMessage
//            return
//        }
//        
//        let newUser = User(id: "1", firstName: firstName, lastName: lastName, email: email, password: password, birthDate: birthDate, point: 0, currentLevel: 0)
//        userViewModel.users.append(newUser)
//        isSignUpSuccess = true
//        errorMessage = nil
//    }
    
    /// Réinitialise le mot de passe de l'utilisateur avec l'email fourni.
    ///
    /// Met à jour `resetPasswordMessage` avec un message de succès si l'email est trouvé,
    /// sinon met à jour `errorMessage` avec un message d'erreur.
    func resetPassword() {
        if let user = userViewModel.users.first(where: { $0.email == email }) {
            resetPasswordMessage = "\(resetPasswordSuccessMessage) \(user.email)"
            errorMessage = nil
        } else {
            errorMessage = emailNotFoundMessage
        }
    }
    
    /// Renvoie l'instance de `UserViewModel`.
    ///
    /// - Returns: L'instance de `UserViewModel` utilisée par ce `AuthViewModel`.
    func getUserViewModel() -> UserViewModel {
        return userViewModel
    }
    
    /// Renvoie l'utilisateur actuellement connecté.
    ///
    /// - Returns: L'utilisateur actuellement connecté, ou `nil` si aucun utilisateur n'est connecté.
    func getCurrentUser() -> User? {
        return userViewModel.users.first(where: { $0.email == email && $0.password == password })
    }
}
