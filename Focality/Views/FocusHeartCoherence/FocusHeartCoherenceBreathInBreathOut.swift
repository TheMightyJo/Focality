import SwiftUI

struct FocusHeartCoherenceBreathInBreathOut: View {
    @State private var scale: CGFloat = 1.0
    @State private var isAnimating = false
    @State private var elapsedTime: Double = 0
    @State private var isTimerRunning = false
    @State private var showModal = false
    @State private var showAlert = false
    @State private var isPaused = false
    @State private var isInhaling = true
    @Binding var selectedTab: Int
    
    let totalTime: Double
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let breathingTimer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    @ObservedObject var viewModelsFocus: ViewModelsFocus
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            // Bouton pour fermer et montrer l'alerte
            HStack {
                Spacer()
                Button(action: {
                    isPaused = isTimerRunning
                    isTimerRunning = false
                    showAlert = true
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                }
                .padding(.trailing, 20)
            }
            
            // Animation et contenu
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 30)
            
            Text(isInhaling ? "Inspirez" : "Expirez")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding(.bottom, 60)
                .padding(.top, 20)
            
            Circle()
                .fill(RadialGradient(gradient: Gradient(colors: [Color.primaire, .secondaire, Color.secondaire.opacity(0.1)]), center: .center, startRadius: 5, endRadius: 200))
                .frame(width: 200, height: 200)
                .scaleEffect(scale)
                .onAppear {
                    startTimer()
                }
                .onChange(of: isTimerRunning) {
                    if isTimerRunning {
                        withAnimation(Animation.easeInOut(duration: 4.0).repeatForever(autoreverses: true)) {
                            self.scale = 1.5
                        }
                    } else {
                        withAnimation {
                            self.scale = 1.0
                        }
                    }
                }
                .padding(.bottom, 80)
            
            // Bouton de pause ou lecture
            Button {
                if isTimerRunning {
                    isTimerRunning = false
                } else {
                    startTimer()
                }
            } label: {
                Image(systemName: isTimerRunning ? "stop.fill" : "play.fill")
                    .resizable()
                    .foregroundColor(.secondaire)
                    .scaledToFit()
                    .frame(width: 48, height: 48)
            }
            
            // Affichage du temps et barre de progression
            VStack {
                HStack {
                    Text(timeString(time: elapsedTime))
                    Spacer()
                    Text(timeString(time: totalTime))
                }
                .padding(.horizontal, 20)
                
                ProgressView(value: elapsedTime, total: totalTime)
                    .progressViewStyle(LinearProgressViewStyle(tint: .accentColor))
                    .padding(.horizontal, 20)
            }
        }
        .onReceive(timer) { _ in
            guard isTimerRunning else {
                return
            }
            if elapsedTime < totalTime {
                elapsedTime += 1
            } else {
                isTimerRunning = false
                showModal = true
            }
        }
        .onReceive(breathingTimer) { _ in
            guard isTimerRunning else {
                return
            }
            isInhaling.toggle()
        }
        .sheet(isPresented: $showModal) {
            FocusHeartCoherenceModal(viewModelsFocus: viewModelsFocus, temps: 1)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Quitter le Focus"),
                message: Text("Voulez-vous vraiment arrêter le focus ?"),
                primaryButton: .destructive(Text("Oui")) {
                    presentationMode.wrappedValue.dismiss()
                    selectedTab = 2
                },
                secondaryButton: .cancel(Text("Non")) {
                    isTimerRunning = isPaused
                }
            )
        }
    }
    
    private func startTimer() {
        elapsedTime = 0
        isTimerRunning = true
    }
    
    private func timeString(time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    FocusHeartCoherenceBreathInBreathOut(selectedTab: .constant(2), totalTime: 300, viewModelsFocus: ViewModelsFocus())
}
