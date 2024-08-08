import Foundation
import Combine

/// ViewModel pour gérer la logique d'authentification.
class AuthViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var email: String
    @Published var password: String
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birthday: Date = Date()
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String? = nil
    @Published var resetPasswordMessage: String? = nil
    @Published var isSignUpSuccess: Bool = false
    @Published var isSignInSuccess: Bool = false

    // MARK: - Private Properties
    private var userViewModel: UserViewModel

    // MARK: - Constants
    private let minimumPasswordLength = 8
    private let emailErrorMessage = "Email ou mot de passe invalide"
    private let signUpErrorMessage = "Veuillez remplir correctement tous les champs"
    private let resetPasswordSuccessMessage = "Un lien de réinitialisation de mot de passe a été envoyé à"
    private let emailNotFoundMessage = "Email non trouvé"

    // MARK: - Initializer
    init(userViewModel: UserViewModel, email: String = "", password: String = "") {
        self.userViewModel = userViewModel
        self.email = email
        self.password = password
    }

    // MARK: - Methods
    func signIn() {
        if userViewModel.users.first(where: { $0.email == email && $0.password == password }) != nil {
            isAuthenticated = true
            isSignInSuccess = true
            errorMessage = nil
        } else {
            errorMessage = emailErrorMessage
        }
    }

    func signUp() {
        guard !email.isEmpty, !password.isEmpty, password.count >= minimumPasswordLength else {
            errorMessage = signUpErrorMessage
            return
        }

        let newUser = User(firstName: firstName, lastName: lastName, email: email, password: password, birthday: birthday, point: 0, currentLevel: 0)
        userViewModel.users.append(newUser)
        isSignUpSuccess = true
        errorMessage = nil
    }

    func resetPassword() {
        if let user = userViewModel.users.first(where: { $0.email == email }) {
            resetPasswordMessage = "\(resetPasswordSuccessMessage) \(user.email)"
            errorMessage = nil
        } else {
            errorMessage = emailNotFoundMessage
        }
    }

    func getUserViewModel() -> UserViewModel {
        return userViewModel
    }

    func getCurrentUser() -> User? {
        return userViewModel.users.first(where: { $0.email == email && $0.password == password })
    }
}
