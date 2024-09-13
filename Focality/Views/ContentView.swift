import SwiftUI
import SwiftData

struct ContentView: View {
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        TabView {
            OnboardingView(
                challengeViewModel: ChallengeViewModel(),
                userViewModel: authViewModel.getUserViewModel(),
                reminderViewModel: ReminderViewModel( dateFormat: DateFormatterToFR()),
                rewardViewModel: RewardViewModel(userViewModel: authViewModel.getUserViewModel()),
                goalViewModel: GoalViewModel()
            )
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profil")
            }
            .tag(0)
            TimerView()
                .tabItem {
                    Image(systemName: "fitness.timer.fill")
                    Text("Timer")
                }
                .tag(1)
            FocusHeartCoherence()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Focus")
                }
                .tag(2)
            ReminderView()
                .tabItem {
                    Image(systemName: "checklist")
                    Text("Rappels")
                }
                .tag(3)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView(authViewModel: AuthViewModel(userViewModel: UserViewModel()))
}
