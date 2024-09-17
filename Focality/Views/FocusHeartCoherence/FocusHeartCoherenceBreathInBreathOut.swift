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
    @State private var navigateToFocus = false
    
    let totalTime: Double
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let inhaleExhaleTimer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    @ObservedObject var viewModelsFocus: ViewModelsFocus
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            headerView
            
            breathingAnimationView
            
            // Bouton de pause ou lecture
            playPauseButton
            
            // Affichage du temps et barre de progression
            timeProgressView
        }
        .onReceive(timer) { _ in
            handleTimerTick()
        }
        .onReceive(inhaleExhaleTimer) { _ in
            toggleBreathingPhase()
        }
        .sheet(isPresented: $showModal) {
            FocusHeartCoherenceModal(viewModelsFocus: viewModelsFocus, temps: 1)
        }
        .onAppear {
            startTimer()
        }
    }
    
    // MARK: - Sous-vues
    
    private var headerView: some View {
        HStack {
            Spacer()
            Button(action: showExitAlert) {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
            }
            .padding(.trailing, 20)
            .alert(isPresented: $showAlert) {
                exitAlert
            }
        }
        .navigationDestination(isPresented: $navigateToFocus) {
            FocusHeartCoherence()
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var breathingAnimationView: some View {
        VStack {
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
                .animation(isTimerRunning ? .easeInOut(duration: 4).repeatForever(autoreverses: true) : .default, value: scale)
                .onAppear {
                    scale = 1.5
                }
                .padding(.bottom, 80)
        }
    }
    
    private var playPauseButton: some View {
        Button {
            toggleTimer()
        } label: {
            Image(systemName: isTimerRunning ? "stop.fill" : "play.fill")
                .resizable()
                .foregroundColor(.secondaire)
                .scaledToFit()
                .frame(width: 48, height: 48)
        }
    }
    
    private var timeProgressView: some View {
        VStack {
            HStack {
                Text(timeString(from: elapsedTime))
                Spacer()
                Text(timeString(from: totalTime))
            }
            .padding(.horizontal, 20)
            
            ProgressView(value: elapsedTime, total: totalTime)
                .progressViewStyle(LinearProgressViewStyle(tint: .accentColor))
                .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Méthodes
    
    private func startTimer() {
        elapsedTime = 0
        isTimerRunning = true
    }
    
    private func toggleTimer() {
        isTimerRunning.toggle()
    }
    
    private func handleTimerTick() {
        guard isTimerRunning else { return }
        
        if elapsedTime < totalTime {
            elapsedTime += 1
        } else {
            isTimerRunning = false
            showModal = true
        }
    }
    
    private func toggleBreathingPhase() {
        guard isTimerRunning else { return }
        isInhaling.toggle()
    }
    
    private func showExitAlert() {
        isPaused = isTimerRunning
        isTimerRunning = false
        showAlert = true
    }
    
    private var exitAlert: Alert {
        Alert(
            title: Text("Quitter le Focus"),
            message: Text("Voulez-vous vraiment arrêter le focus ?"),
            primaryButton: .destructive(Text("Oui")) {
                navigateToFocus = true
            },
            secondaryButton: .cancel(Text("Non")) {
                isTimerRunning = isPaused
            }
        )
    }
    
    private func timeString(from time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    FocusHeartCoherenceBreathInBreathOut(totalTime: 300, viewModelsFocus: ViewModelsFocus())
}
