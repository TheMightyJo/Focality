import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false // État pour gérer la navigation vers la vue d'authentification
    
    var body: some View {
        VStack {
            if isActive {
                // Navigation vers la vue d'authentification lorsque isActive est vrai
                AuthView(userViewModel: UserViewModel())
            } else {
                // Affichage de l'écran de démarrage avec le logo
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                .onAppear {
                    // Déclencher la navigation après 10 secondes
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.isActive = true
                    }
                }
            }
        }
        .background(Color.white) // Couleur de fond blanche
        .edgesIgnoringSafeArea(.all) // Ignorer les bordures de la zone sécurisée
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
