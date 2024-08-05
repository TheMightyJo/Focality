import SwiftUI

struct OnboardingView: View {
    @ObservedObject var challengeViewModel: ChallengeViewModel
    @ObservedObject var userViewModel: UserViewModel
    @StateObject private var viewModel = TimerViewModel(isRunning: false, currentTime: 0) // Instance du ViewModel pour gérer l'état
    @State private var showTimerView = false
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Image("Logo")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Spacer()
                        Image("ProfilePicture")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Text("Bienvenue sur Focality")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 20)
                    
                    if challengeViewModel.challenges.count >= 2 {
                        VStack(spacing: 20) {
                            ChallengeRowView(userViewModel: userViewModel, challenge: challengeViewModel.challenges[0])
                            
                            ChallengeRowView(userViewModel: userViewModel, challenge: challengeViewModel.challenges[1])
                        }
                        .padding(.horizontal)
                    } else {
                        Text("Pas assez de défis disponibles.")
                    }
                    Spacer()
                    NavigationLink(destination: TimerView()) {
                        VStack {
                            ZStack {
                                Ellipse()
                                    .fill(Color.primaire)
                                    .frame(width: 54, height: 54)
                                    .padding()
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(Color(.black))
                                    .padding(.leading, 5)
                            }
                            Text("1 heure")
                                .font(.title).bold()
                        }
                    }
                    
                    Button(action: {
                        showTimerView.toggle()
                    }) {
                        Image(systemName: "fitness.timer.fill")
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
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(challengeViewModel: ChallengeViewModel(), userViewModel: UserViewModel())
    }
}
