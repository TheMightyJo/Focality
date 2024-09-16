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
                
                NavigationLink(destination: ContentView(authViewModel: AuthViewModel(userViewModel: UserViewModel()))){
                    Text("Connexion")
                }
                .foregroundColor(.white).bold()
                .padding()
                .background(.secondaire)
                .cornerRadius(10)
                
                NavigationLink(destination: InscriptionUserView(userViewModel: UserViewModel())) {
                    Text("Pas encore inscrit ? S'inscrire")
                        .font(.footnote)
                        .foregroundColor(.secondary).bold()
                }
                
                NavigationLink(destination: ForgotPasswordView(authViewModel: authViewModel)) {
                    Text("Mot de passe oublié ?")
                        .font(.footnote)
                        .foregroundColor(.secondary).bold()
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
