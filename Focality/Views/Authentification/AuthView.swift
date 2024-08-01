import SwiftUI

struct AuthView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var isSignUpMode = false
    
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
                    GamificationProfileView(
                        rewardViewModel: RewardViewModel(userViewModel: authViewModel.userViewModel),
                        challengeViewModel: ChallengeViewModel(),
                        userViewModel: authViewModel.userViewModel
                    )
                    .navigationBarBackButtonHidden(true)
                }
                
                NavigationLink(destination: inscriptionUserView(userViewModel: authViewModel.userViewModel)) {
                    Text("Pas encore inscrit ? S'inscrire")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
                .padding(.top, 10)
                
                NavigationLink(destination: ForgotPasswordView(authViewModel: authViewModel)) {
                    Text("Mot de passe oublié ?")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
                .padding(.top, 10)
                
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
