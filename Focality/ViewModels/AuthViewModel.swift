import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birthday: Date = Date()
    
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String? = nil
    @Published var resetPasswordMessage: String? = nil
    
    private var users: [User] = [] // Simulated user database
    
    func signIn() {
        if let user = users.first(where: { $0.email == email && $0.password == password }) {
            isAuthenticated = true
            errorMessage = nil
            // Handle user session
        } else {
            errorMessage = "Invalid email or password"
        }
    }
    
    func signUp() {
        if !email.isEmpty && !password.isEmpty && password.count >= 8 {
            let newUser = User(firstName: firstName, lastName: lastName, email: email, password: password, birthday: birthday, point: 0, currentLevel: 0)
            users.append(newUser)
            isAuthenticated = true
            errorMessage = nil
            // Handle user session
        } else {
            errorMessage = "Please fill all fields correctly"
        }
    }
    
    func resetPassword() {
        if let user = users.first(where: { $0.email == email }) {
            // Simulate password reset
            resetPasswordMessage = "A password reset link has been sent to \(user.email)"
            errorMessage = nil
        } else {
            errorMessage = "Email not found"
        }
    }
}
