import SwiftUI

struct FocusHeartCoherenceTimer: View {
<<<<<<< Updated upstream
    @State private var timeRemaining = 3
    @State private var selectedDuration: Double = 0.00
=======
    @State private var initialCountdown = 3
    @State private var timeRemaining: Int
>>>>>>> Stashed changes
    @State private var navigateBreathOut = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject var userViewModel: UserViewModel
    var user: User
    var duration: Int
    
    init(duration: Int, userViewModel: UserViewModel, user: User) {
        self.duration = duration
        _timeRemaining = State(initialValue: duration * 60)
        self.userViewModel = userViewModel
        self.user = user
    }
    
    var body: some View {
<<<<<<< Updated upstream
    
        NavigationStack{
            VStack(alignment: .center){
                
=======
        NavigationStack {
            VStack(alignment: .center) {
>>>>>>> Stashed changes
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 30)
                
                Text("Focus")
<<<<<<< Updated upstream
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 30))
                    .padding(.bottom, 60)
                
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [Color.primaire ,.secondaire, Color.secondaire.opacity(10)]),
                                         center: .center,
                                         startRadius: 5,
                                         endRadius: 200
                                        )
                    )
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 30)
                
                    .onReceive(timer) { time in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        }else{
                            navigateBreathOut = true
                        }
                    }
                Text(" \(timeRemaining)")
                    .font(.system(size: 60))
                    .foregroundStyle(.black)
                 
                
              
                
                
                NavigationLink(destination : FocusHeartCoherenceBreathInBreathOut(), isActive: $navigateBreathOut){
=======
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .padding(.bottom, 60)
                
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [Color.primaire, .secondaire, Color.secondaire.opacity(0.1)]),
                                         center: .center,
                                         startRadius: 5,
                                         endRadius: 200
                                        )
                    )
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 30)
                    .onReceive(timer) { _ in
                        if initialCountdown > 0 {
                            initialCountdown -= 1
                        } else if timeRemaining > 0 {
                            timeRemaining -= 1
                        } else {
                            navigateBreathOut = true
                        }
                    }
                
                Text(initialCountdown > 0 ? "\(initialCountdown)" : "\(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                    .font(.system(size: 60))
                    .foregroundStyle(.black)
                
                NavigationLink(destination: FocusHeartCoherenceBreathInBreathOut(totalTime: Double(duration * 60), viewModelsFocus: ViewModelsFocus(), userViewModel: userViewModel, user: user), isActive: $navigateBreathOut) {
>>>>>>> Stashed changes
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    FocusHeartCoherenceTimer(duration: 5, userViewModel: UserViewModel(), user: User(firstName: "John", lastName: "Doe", email: "john.doe@example.com", password: "password", birthday: Date(), point: 0, currentLevel: 0))
}
