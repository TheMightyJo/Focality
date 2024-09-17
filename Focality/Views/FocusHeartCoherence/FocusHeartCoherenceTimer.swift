import SwiftUI

// Vue pour le minuteur de cohérence cardiaque
struct FocusHeartCoherenceTimer: View {
    // Variable d'état pour le compte à rebours initial
    @State private var countdownValue = 3
    // Variable d'état pour naviguer vers la vue de respiration
    @State private var shouldNavigateToBreathOut = false
    // Timer qui se déclenche toutes les secondes
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // Durée sélectionnée pour l'exercice
    var duration: Int
    
    var body: some View {
        // NavigationStack permet la navigation entre les vues
        NavigationStack {
            VStack(alignment: .center) {
                // Affichage de l'image du logo
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 30)
                
                // Texte "Préparez-vous !"
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
                // Action déclenchée à chaque tick du Timer
                    .onReceive(timer) { _ in
                        handleTimerTick()
                    }
                
                // Affichage du compte à rebours
                Text("\(countdownValue)")
                    .font(.system(size: 60))
                    .foregroundStyle(.black)
            }
            // Navigation automatique vers la vue de respiration
            .navigationDestination(isPresented: $shouldNavigateToBreathOut) {
                FocusHeartCoherenceBreathInBreathOut(
                    totalTime: Double(duration * 60),
                    viewModelsFocus: ViewModelsFocus()
                )
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    // Gestion des ticks du timer
    private func handleTimerTick() {
        if countdownValue > 0 {
            countdownValue -= 1
        } else {
            shouldNavigateToBreathOut = true
        }
    }
}

// Prévisualisation de la vue avec un utilisateur fictif
#Preview {
    FocusHeartCoherenceTimer(duration: 5)
}
