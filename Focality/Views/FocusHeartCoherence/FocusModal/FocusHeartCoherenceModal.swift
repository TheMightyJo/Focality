import SwiftUI

struct FocusHeartCoherenceModal: View {
    @ObservedObject var viewModelsFocus: ViewModelsFocus
    @State var temps: Int
    @State var objectif = 0
    @State var nombreDePoint = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 42)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.secondaire, .gray]), startPoint: .top, endPoint: .bottom)
                )
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Focus()
                
                //                Image("flamme")
                //
                //                Text("Félicitations!")
                //                    .fontWeight(.semibold)
                //                    .font(.system(size: 24))
                //                    .padding(.bottom, 10)
                //                    .foregroundColor(.white)
                //
                //                Text("Vous venez de terminer la séance \n Respiration Focus !")
                //                    .fontWeight(.regular)
                //                    .font(.system(size: 18))
                //                    .padding(.bottom, 40)
                //                    .foregroundColor(.white)
                //                    .multilineTextAlignment(.center)
                
                // Informations
                HStack {
                    Spacer()
                    InfoView(title: "TEMPS", value: $temps)
                    Spacer()
                    InfoView(title: "POINTS", value: $nombreDePoint)
                    Spacer()
                    InfoView(title: "OBJECTIF", value: $objectif)
                    Spacer()
                }
                .padding(.bottom, 30)
                
                Text("Vous avez été guidés par ")
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                
                Text("Focality")
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Ferme la vue modale
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.orange)
                            .frame(width: 200, height: 50)
                        Text("Merci")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                .padding(.bottom, 30)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct InfoView: View {
    var title: String
    @Binding var value: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.white)
            TextField("", value: $value, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .frame(width: 60)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
        }
    }
}

//#Preview {
//    FocusHeartCoherenceModal(viewModelsFocus: ViewModelsFocus(), temps: 5, user: User(id: "1", firstName: "John", lastName: "Doe", email: "john.doe@example.com", password: "password", birthDate: "11/01/1999", points: "0", currentLevel: "0"))
//}

/// Focus est une structure qui permet d'intégrer un contrôleur de vue UIKit (FocusViewController) dans une vue SwiftUI.
/// Cette structure implémente le protocole UIViewControllerRepresentable pour gérer la création et la mise à jour du contrôleur de vue UIKit.

struct Focus: UIViewControllerRepresentable {
    /// Méthode pour créer et initialiser le contrôleur de vue UIKit.
    
    /// Parameter context: Le contexte SwiftUI utilisé pour la création du contrôleur de vue.
    /// Returns: Une instance de FocusViewController configurée.
    func makeUIViewController(context: Context) -> some FocusViewController {
        /// Instancie le contrôleur de vue à partir du storyboard nommé "FocusMain".
        guard let focusVC = UIStoryboard(name: "FocusMain", bundle: .main).instantiateViewController(identifier: "FocusViewController") as? FocusViewController else {
            /// Si l'instanciation échoue, une erreur fatale est générée.
            fatalError("cannot instantiate FocusViewController")
        }
        /// Retourne le contrôleur de vue instancié.
        return focusVC
    }
    
    /// Méthode pour mettre à jour le contrôleur de vue UIKit.
    
    /// Cette méthode est appelée lorsque l'état de la vue change. Cependant, dans ce cas précis, aucune mise à jour n'est nécessaire.
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // nothing to do
    }
}
