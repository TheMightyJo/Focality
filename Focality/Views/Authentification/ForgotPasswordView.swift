import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
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
                
                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                if let resetPasswordMessage = authViewModel.resetPasswordMessage {
                    Text(resetPasswordMessage)
                        .foregroundColor(.green)
                        .padding()
                }
                
                CustomButton(title: "Réinitialiser le mot de passe", backgroundColor: .accentColor, action: { authViewModel.resetPassword()})
                    .padding()
                
//                Button(action: {
//                    authViewModel.resetPassword()
//                }) {
//                    Text("Réinitialiser le mot de passe")
//                        .frame(maxWidth: .infinity)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Mot de passe oublié")
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
