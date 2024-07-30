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
                
                TextField("Email", text: $authViewModel.email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                ZStack {
                    if isPasswordVisible {
                        TextField("Mot de passe", text: $authViewModel.password)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                    } else {
                        SecureField("Mot de passe", text: $authViewModel.password)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.secondaire)
                        }
                        .padding(.trailing, 16)
                    }
                }
                
                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button(action: {
                    isSignUpMode ? authViewModel.signUp() : authViewModel.signIn()
                }) {
                    Text(isSignUpMode ? "S'inscrire" : "Se connecter")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.text)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                }
                .padding(.top, 10)
                .navigationDestination(isPresented: $authViewModel.isSignInSuccess) {
                    GamificationProfileView(
                        rewardViewModel: RewardViewModel(userViewModel: UserViewModel()),
                        challengeViewModel: ChallengeViewModel(),
                        userViewModel: UserViewModel()
                    )
                    .navigationBarBackButtonHidden(true)
                }
                
                Button(action: {
                    isSignUpMode.toggle()
                }) {
                    Text(isSignUpMode ? "Déjà inscrit ? Se connecter" : "Pas encore inscrit ? S'inscrire")
                        .font(.system(size: 15))
                        .foregroundColor(.text)
                }
                
                if !isSignUpMode {
                    NavigationLink(destination: ForgotPasswordView(authViewModel: authViewModel)) {
                        Text("Mot de passe oublié ?")
                            .font(.system(size: 15))
                            .foregroundColor(.text)
                    }
                    
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
