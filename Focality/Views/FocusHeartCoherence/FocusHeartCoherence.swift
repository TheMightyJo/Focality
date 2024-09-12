import SwiftUI

// Vue principale pour la cohérence cardiaque
struct FocusHeartCoherence: View {
    // Variable d'état pour suivre la durée sélectionnée
    @State private var selectedDuration: Int = 5
    
    // ObservedObject pour observer les changements dans les données utilisateur
    @ObservedObject var userViewModel: UserViewModel
    
    // Modèle de données utilisateur
    var user: User

    var body: some View {
        // NavigationStack permet la navigation entre les vues
        NavigationStack {
            VStack {
                // Affichage de l'image du logo
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 10)
                
                // Texte "Focus" en gras et taille de police 30
                Text("Focus")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .padding(.bottom, 70)
                
                // Affichage de l'image de la concentration
                Image("Focus")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 40)
                
                // Texte "Breathing Focus" en semi-gras et taille de police 20
                Text("Breathing Focus")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.bottom, 30)
                
                // Sélecteur de durée
                Picker("Durée", selection: $selectedDuration) {
                    // Boucle pour créer des options de 1 à 5 minutes
                    ForEach(1..<6) { minute in
                        Text("\(minute) minutes").tag(minute)
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .pickerStyle(WheelPickerStyle()) // Style de sélecteur en roue
                .padding(.horizontal)
                .padding(.bottom, 30)
                
                // Lien de navigation vers le minuteur de cohérence cardiaque
                NavigationLink(destination: FocusHeartCoherenceTimer(duration: selectedDuration, userViewModel: userViewModel, user: user)) {
                    ZStack {
                        // Rectangle arrondi pour le bouton "Commencer"
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.secondaire) // Couleur de remplissage secondaire
                            .frame(width: 300, height: 50)
                        
                        // Texte "Commencer" en blanc
                        Text("Commencer")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
    }
}

// Prévisualisation de la vue avec un utilisateur fictif
#Preview {
    FocusHeartCoherence(userViewModel: UserViewModel(), user: User(id: "1", firstName: "John", lastName: "Doe", email: "john.doe@example.com", password: "password", birthday: Date(), point: 0, currentLevel: 0))
}
