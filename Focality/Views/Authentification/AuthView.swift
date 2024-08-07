import SwiftUI

struct AuthView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var isSignUpMode = false
    @State private var isPasswordVisible = false
    
    init(userViewModel: UserViewModel) {
        _authViewModel = ObservedObject(wrappedValue: AuthViewModel(userViewModel: userViewModel, email: "emiliano@gmail.com", password: "Teamcook5*"))
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25.0) {
                Spacer()
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 20)
                
                TextFieldView(placeholder: "Email", text: $authViewModel.email, isSecure: false)
                TextFieldView(placeholder: "Mot de passe", text: $authViewModel.password, isSecure: true)
                
                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                CustomButton(title: "Se connecter", backgroundColor: .blue) {
                    authViewModel.signIn()
                }
                .padding(.top, 10)
                .navigationDestination(isPresented: $authViewModel.isSignInSuccess) {
                    ContentView(
                        authViewModel: AuthViewModel(userViewModel: UserViewModel()))
                    .navigationBarBackButtonHidden(true)
                }
                
                NavigationLink(destination: InscriptionUserView(userViewModel: authViewModel.getUserViewModel())) {
                    Text("Pas encore inscrit ? S'inscrire")
                        .font(.footnote)
                        .foregroundColor(.secondaire).bold()
                }
                
                NavigationLink(destination: ForgotPasswordView(authViewModel: authViewModel)) {
                    Text("Mot de passe oublié ?")
                        .font(.footnote)
                        .foregroundColor(.secondaire).bold()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(userViewModel: UserViewModel())
    }
}
