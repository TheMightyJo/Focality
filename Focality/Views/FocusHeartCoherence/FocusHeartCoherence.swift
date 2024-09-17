import SwiftUI

struct FocusHeartCoherence: View {
    @State private var selectedDurationInMinutes: Int = 1
    
    var body: some View {
        // NavigationStack permet la navigation entre les vues
        NavigationStack {
            VStack(spacing: 30.0) {
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Focus")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                Image("Focus")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Breathing Focus")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                
                // Sélecteur de durée
                Picker("Durée", selection: $selectedDurationInMinutes) {
                    // Boucle pour créer des options de 1 à 5 minutes
                    ForEach(1..<6) { minute in
                        Text("\(minute) minutes").tag(minute)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding(.horizontal)
                
                // Lien de navigation vers le minuteur de cohérence cardiaque
                NavigationLink(destination: FocusHeartCoherenceTimer(duration: selectedDurationInMinutes)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.secondaire)
                            .frame(width: 300, height: 50)
                        
                        Text("Commencer")
                            .foregroundColor(.white)
                    }
                    .padding()
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {  
    FocusHeartCoherence()
}
