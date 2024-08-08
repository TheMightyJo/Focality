import SwiftUI

struct InscriptionUserView: View {
    @ObservedObject var userViewModel: UserViewModel
    @ObservedObject var authViewModel: AuthViewModel
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var birthday = Date()
    @State private var navigateToContentView = false

    var body: some View {
        VStack {
            Text("Inscription")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding(.trailing, 200)

            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100)

            List {
                HStack {
                    Text("FirstName")
                    TextField("FirstName", text: $firstName)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                HStack {
                    Text("LastName")
                    TextField("LasttName", text: $lastName)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                HStack {
                    Text("Email")
                    TextField("Email", text: $email)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                HStack {
                    Text("Password")
                    SecureField("Password", text: $password)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                HStack {
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaire)
                        .frame(width: 300, height: 50)
                    Button(action: {
                        authViewModel.firstName = firstName
                        authViewModel.lastName = lastName
                        authViewModel.email = email
                        authViewModel.password = password
                        authViewModel.birthday = birthday
                        authViewModel.signUp()
                        if authViewModel.isSignUpSuccess {
                            navigateToContentView = true
                        }
                    }, label: {
                        Text("Création")
                    })
                    .foregroundColor(.black)
                    .font(.custom("arial", size: 30))
                }
            }
            .scrollContentBackground(.hidden)
            
            NavigationLink(destination: ContentView(authViewModel: authViewModel), isActive: $navigateToContentView) {
                EmptyView()
            }
        }
    }
}

#Preview {
    InscriptionUserView(userViewModel: UserViewModel(), authViewModel: AuthViewModel(userViewModel: UserViewModel()))
}
