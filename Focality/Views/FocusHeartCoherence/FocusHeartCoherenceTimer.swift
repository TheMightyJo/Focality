import SwiftUI

struct FocusHeartCoherenceTimer: View {
    @State private var initialCountdown = 3
    @State private var navigateBreathOut = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject var userViewModel: UserViewModel
    var user: User
    var duration: Int
    
    init(duration: Int, userViewModel: UserViewModel, user: User) {
        self.duration = duration
        self.userViewModel = userViewModel
        self.user = user
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 30)
                
                Text("Focus")
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
                        } else {
                            navigateBreathOut = true
                        }
                    }
                
                Text("\(initialCountdown)")
                    .font(.system(size: 60))
                    .foregroundStyle(.black)
                
                NavigationLink(destination: FocusHeartCoherenceBreathInBreathOut(totalTime: Double(duration * 60), viewModelsFocus: ViewModelsFocus(), userViewModel: userViewModel, user: user), isActive: $navigateBreathOut) {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    FocusHeartCoherenceTimer(duration: 5, userViewModel: UserViewModel(), user: User(firstName: "John", lastName: "Doe", email: "john.doe@example.com", password: "password", birthday: Date(), point: 0, currentLevel: 0))
}
