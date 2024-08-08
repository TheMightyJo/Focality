import SwiftUI
import SwiftData

struct ContentView: View {
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
        TabView {
            // Profil Tab
            OnboardingView(
                challengeViewModel: ChallengeViewModel(),
                userViewModel: authViewModel.getUserViewModel(),
                reminderViewModel: ReminderViewModel(),
                rewardViewModel: RewardViewModel(userViewModel: authViewModel.getUserViewModel()),
                goalViewModel: GoalViewModel()
            )
            .tabItem {
                Image(systemName: "house.fill")
                Text("Profil")
            }
            .tag(0)
            
            // Timer Tab
            TimerView()
                .tabItem {
                    Image(systemName: "fitness.timer.fill")
                    Text("Timer")
                }
                .tag(1)
            
            // Focus Tab
            if let currentUser = authViewModel.getCurrentUser() {
                FocusHeartCoherence(
                    userViewModel: authViewModel.getUserViewModel(),
                    user: currentUser
                )
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Focus")
                }
                .tag(2)
            }
            
            // Reminder Tab
            ReminderView()
                .tabItem {
                    Image(systemName: "checklist")
                    Text("Rappels")
                }
                .tag(3)
        }
    }
}

#Preview {
    ContentView(authViewModel: AuthViewModel(userViewModel: UserViewModel()))
}
