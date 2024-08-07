import SwiftUI

struct FocusHeartCoherenceBreathInBreathOut: View {
    @State private var scale: CGFloat = 1.0
    @State private var isAnimating = false
    @State private var elapsedTime: Double = 0
    @State private var isTimerRunning = false
    @State private var showModal = false
    let totalTime: Double
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModelsFocus: ViewModelsFocus
    @ObservedObject var userViewModel: UserViewModel
    var user: User
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                }
                .padding(.trailing, 20)
            }

            HStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            Spacer()
            
            HStack {
                Text("Focus")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
            }
            .padding(.bottom, 100)
            
            Circle()
                .fill(RadialGradient(gradient: Gradient(colors: [Color.primaire, .secondaire, Color.secondaire.opacity(0.1)]), center: .center, startRadius: 5, endRadius: 200))
                .frame(width: 200, height: 200)
                .scaleEffect(scale)
                .onAppear {
                    startTimer()
                }
                .onChange(of: isTimerRunning) { running in
                    if running {
                        withAnimation(Animation.easeInOut(duration: 4.0).repeatForever(autoreverses: true)) {
                            self.scale = 1.5
                        }
                    } else {
                        withAnimation {
                            self.scale = 1.0
                        }
                    }
                }
                .padding(.bottom, 90)
            
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
                    .padding(.bottom, 30)
            }
            
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
            .padding(.bottom, 30)
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
                userViewModel.addPoints(to: user, points: 10)
            }
        }
        .sheet(isPresented: $showModal) {
            FocusHeartCoherenceModal(viewModelsFocus: viewModelsFocus, temps: Int(totalTime), user: user)
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
    FocusHeartCoherenceBreathInBreathOut(totalTime: 300, viewModelsFocus: ViewModelsFocus(), userViewModel: UserViewModel(), user: User(firstName: "John", lastName: "Doe", email: "john.doe@example.com", password: "password", birthday: Date(), point: 0, currentLevel: 0))
}
