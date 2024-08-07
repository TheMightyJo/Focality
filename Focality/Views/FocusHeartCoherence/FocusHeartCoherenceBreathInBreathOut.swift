import SwiftUI

struct FocusHeartCoherenceBreathInBreathOut : View {
    @State private var scale: CGFloat = 1.0
    @State private var isAnimating = false
<<<<<<< Updated upstream
    @State private var timeRemaining: Double = 300
    @State private var selectedDuration: Double = 300
    @State private var isTimerRuning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
=======
    @State private var elapsedTime: Double = 0
    @State private var isTimerRunning = false
    @State private var showModal = false
    let totalTime: Double
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModelsFocus: ViewModelsFocus
    @ObservedObject var userViewModel: UserViewModel
    var user: User
>>>>>>> Stashed changes
    
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
<<<<<<< Updated upstream
                .frame(width: 100, height: 100)}
            Spacer()
            
            HStack{Text("Focus")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 30))}
=======
                    .frame(width: 100, height: 100)
            }
            Spacer()
            
            HStack {
                Text("Focus")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
            }
>>>>>>> Stashed changes
            .padding(.bottom, 100)
            
            Circle()
<<<<<<< Updated upstream
                .fill(RadialGradient(gradient: Gradient(colors: [Color.primaire ,.secondaire, Color.secondaire.opacity(10)]),center: .center, startRadius: 5, endRadius: 200))
                .frame(width: 200, height: 200)
                .scaleEffect(scale)
                .onAppear{
                    if isTimerRuning{
                        
                        
                        
                        withAnimation(Animation.easeInOut(duration: 4.0).repeatForever(autoreverses: true)) {self.scale = 1.5}
                    }
                    
                }
                
                .onChange(of: isTimerRuning) {
                    running in
                    if running {
                        withAnimation(Animation.easeInOut(duration: 4.0).repeatForever(autoreverses: true)) {self.scale = 1.5}
                    }else{
                        withAnimation{
=======
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
>>>>>>> Stashed changes
                            self.scale = 1.0
                        }
                    }
                }
<<<<<<< Updated upstream
                .padding(.bottom, 100)
            
            Button {
                if isTimerRuning{
                    isTimerRuning = false
                }else{
                    startTimer()
                }
                
            } label: {
                Image(systemName : isTimerRuning ?  "stop.fill" : "play.fill")
=======
                .padding(.bottom, 90)
            
            Button {
                if isTimerRunning {
                    isTimerRunning = false
                } else {
                    startTimer()
                }
            } label: {
                Image(systemName: isTimerRunning ? "stop.fill" : "play.fill")
>>>>>>> Stashed changes
                    .resizable()
                    .foregroundColor(.secondaire)
                    .scaledToFit()
                    .frame(width: 48, height: 48)
<<<<<<< Updated upstream
                    .padding(.bottom, 10)
                
                
                
            }
            
            HStack {
                Text("0:00")
                Slider(value: $selectedDuration, in: 0...300, step: 1)
                Text("5:00")
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 70)
            
        }.onReceive(timer)  { _ in
            guard isTimerRuning else {
                return
            }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }else{
                isTimerRuning = false
            }
        }
    }
        
    
    
    
    
    private func startTimer(){
        timeRemaining = selectedDuration
        isTimerRuning = true
    }
}

#Preview {
    FocusHeartCoherenceBreathInBreathOut()
=======
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
>>>>>>> Stashed changes
}

#Preview {
    FocusHeartCoherenceBreathInBreathOut(totalTime: 300, viewModelsFocus: ViewModelsFocus(), userViewModel: UserViewModel(), user: User(firstName: "John", lastName: "Doe", email: "john.doe@example.com", password: "password", birthday: Date(), point: 0, currentLevel: 0))
}
