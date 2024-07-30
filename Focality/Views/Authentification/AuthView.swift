import SwiftUI

struct AuthView: View {
    @ObservedObject var authViewModel = AuthViewModel()
    @State private var isSignUpMode = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 20)
                
                if isSignUpMode {
                    TextField("Prénom", text: $authViewModel.firstName)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                    
                    TextField("Nom", text: $authViewModel.lastName)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                    
                    DatePicker("Date de naissance", selection: $authViewModel.birthday, displayedComponents: .date)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                }
                
                TextField("Email", text: $authViewModel.email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                
                SecureField("Mot de passe", text: $authViewModel.password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                
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
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                
                Button(action: {
                    isSignUpMode.toggle()
                }) {
                    Text(isSignUpMode ? "Déjà inscrit ? Se connecter" : "Pas encore inscrit ? S'inscrire")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
                .padding(.top, 10)
                
                if !isSignUpMode {
                    NavigationLink(destination: ForgotPasswordView(authViewModel: authViewModel)) {
                        Text("Mot de passe oublié ?")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
