import SwiftUI

struct OnboardingView: View {
    @ObservedObject var challengeViewModel: ChallengeViewModel
    @ObservedObject var userViewModel: UserViewModel
    @State private var showTimerView = false
    
    var body: some View {
        VStack {
            Text("Bienvenue à Focality")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            
            Text("Voici vos premiers défis :")
                .font(.title2)
                .padding(.bottom, 20)
            
            if challengeViewModel.challenges.count >= 2 {
                HStack(spacing: 20) {
                    ChallengeRowView(userViewModel: userViewModel, challenge: challengeViewModel.challenges[0])
                        .frame(width: UIScreen.main.bounds.width / 2 - 30, height: 200)
                    
                    ChallengeRowView(userViewModel: userViewModel, challenge: challengeViewModel.challenges[1])
                        .frame(width: UIScreen.main.bounds.width / 2 - 30, height: 200)
                }
                .padding(.horizontal)
            } else {
                Text("Pas assez de défis disponibles.")
            }
            
            Spacer()
            
            Button(action: {
                showTimerView.toggle()
            }) {
                Text("Lancer le Minuteur")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 20)
            .sheet(isPresented: $showTimerView) {
                TimerView()
            }
            
            Button(action: {
                // Action pour démarrer
            }) {
                Text("Commencer")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 40)
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(challengeViewModel: ChallengeViewModel(), userViewModel: UserViewModel())
    }
}
