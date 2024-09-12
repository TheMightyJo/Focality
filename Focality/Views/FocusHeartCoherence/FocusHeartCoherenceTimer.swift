import SwiftUI

// Vue pour le minuteur de cohérence cardiaque
struct FocusHeartCoherenceTimer: View {
    // Variable d'état pour le compte à rebours initial
    @State private var initialCountdown = 3
    // Variable d'état pour naviguer vers la vue de respiration
    @State private var navigateBreathOut = false
    // Timer qui se déclenche toutes les secondes
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // ObservedObject pour observer les changements dans les données utilisateur
    @ObservedObject var userViewModel: UserViewModel
    
    // Modèle de données utilisateur
    var user: User
    
    // Durée sélectionnée pour l'exercice
    var duration: Int
    
    // Initialisation avec les paramètres
    init(duration: Int, userViewModel: UserViewModel, user: User) {
        self.duration = duration
        self.userViewModel = userViewModel
        self.user = user
    }
    
    var body: some View {
        // NavigationStack permet la navigation entre les vues
        NavigationStack {
            VStack(alignment: .center) {
                // Affichage de l'image du logo
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 30)
                
                // Texte "Focus" en gras et taille de police 30
                Text("Préparez-vous !")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .padding(.bottom, 60)
                
                // Cercle avec dégradé radial
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [Color.primaire, .secondaire, Color.secondaire.opacity(0.1)]),
                                         center: .center,
                                         startRadius: 5,
                                         endRadius: 200))
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 30)
                    // Action à chaque déclenchement du timer
                    .onReceive(timer) { _ in
                        if initialCountdown > 0 {
                            initialCountdown -= 1
                        } else {
                            navigateBreathOut = true
                        }
                    }
                
                // Affichage du compte à rebours
                Text("\(initialCountdown)")
                    .font(.system(size: 60))
                    .foregroundStyle(.black)
                
                // Lien de navigation vers la vue de respiration, activé à la fin du compte à rebours
                NavigationLink(destination: FocusHeartCoherenceBreathInBreathOut(totalTime: Double(duration * 60), viewModelsFocus: ViewModelsFocus(), userViewModel: userViewModel, user: user)
                    .navigationBarBackButtonHidden(true), isActive: $navigateBreathOut) {
                        EmptyView()
                    }
            }
        }
    }
}

// Prévisualisation de la vue avec un utilisateur fictif
//#Preview {
//    FocusHeartCoherenceTimer(duration: 5, userViewModel: UserViewModel(), user: User(id: "1", firstName: "John", lastName: "Doe", email: "john.doe@example.com", password: "password", birthDate: "11/01/1999", points: "0", currentLevel: "0"))
//}
