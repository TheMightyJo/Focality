import SwiftUI
import SwiftData

struct ContentView: View {
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
        TabView {
            OnboardingView(
                challengeViewModel: ChallengeViewModel(),
                timerViewModel: TimerViewModel(isRunning: false, currentTime: 0),
                authViewModel: authViewModel,
                userViewModel: authViewModel.getUserViewModel(),
                reminderViewModel: ReminderViewModel(),
                rewardViewModel: RewardViewModel(userViewModel: authViewModel.getUserViewModel()),
                goalViewModel: GoalViewModel()
            )
            .tabItem {
                Image(systemName: "house.fill")
                Text("Profil")
            }

            TimerView()
                .tabItem {
                    Image(systemName: "fitness.timer.fill")
                    Text("Timer")
                }

            if let currentUser = authViewModel.getCurrentUser() {
                FocusHeartCoherence(userViewModel: authViewModel.getUserViewModel(), user: currentUser)
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Focus")
                    }
            }

            ReminderView()
                .tabItem {
                    Image(systemName: "checklist")
                    Text("Rappels")
                }
        }
    }
}

#Preview {
    ContentView(authViewModel: AuthViewModel(userViewModel: UserViewModel()))
}
