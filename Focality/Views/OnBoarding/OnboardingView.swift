import SwiftUI

struct OnboardingView: View {
    @ObservedObject var challengeViewModel: ChallengeViewModel
    @ObservedObject var userViewModel: UserViewModel
    @ObservedObject var reminderViewModel: ReminderViewModel
    @ObservedObject var rewardViewModel: RewardViewModel
    @ObservedObject var goalViewModel: GoalViewModel
    @StateObject private var timerViewModel1 = TimerViewModel(isRunning: false, currentTime: 0)
    @StateObject private var timerViewModel2 = TimerViewModel(isRunning: false, currentTime: 0)
    @State private var showingAddGoalView = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 20.0) {
                    Image("Logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text("Bienvenue")  .font(.largeTitle).bold()
                        
                        if let user = userViewModel.users.first {
                            Text("\(user.firstName)")
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.trailing, 10)
                        }
                    }
                    Image("ProfilePicture")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                }
                GamificationCardView(rewardViewModel: rewardViewModel, userViewModel: userViewModel)
                
                HStack {
                    Text("Objectifs")
                        .font(.title2).bold()
                    Spacer()
                    Button(action: {
                        showingAddGoalView = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
//                    .sheet(isPresented: $showingAddGoalView) {
//                        AddGoal(goalViewModel: goalViewModel)
//                    }
                }
                .padding(.horizontal)
                
                if goalViewModel.goals.count >= 1 {
                    VStack(spacing: 20) {
                        ForEach(goalViewModel.goals) { goal in
                            GoalCardView(goal: goal)
                        }
                    }
                    .padding(.horizontal)
                } else {
                    Text("Pas d'objectifs disponibles.")
                }
                
                
                Text("Mes Timers :")
                    .font(.title2).bold()
                
                HStack(spacing: 20) {
                    TimerCardView(timerViewModel: timerViewModel1, focusTime: 15)
                        .frame(width: UIScreen.main.bounds.width / 2 - 30, height: 200)
                    
                    TimerCardView(timerViewModel: timerViewModel2, focusTime: 25)
                        .frame(width: UIScreen.main.bounds.width / 2 - 30, height: 200)
                }
                .padding(.horizontal)
                
                Text("Mes Rappels :")
                    .font(.title2)
                    .bold()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(reminderViewModel.rappels.prefix(4)) { reminder in
                            ReminderCardView(reminder: reminder)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    return formatter
}()

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        let startDate = dateFormatter.date(from: "01/08/2024") ?? Date()
        let endDate = dateFormatter.date(from: "31/08/2024") ?? Date()
        
        return OnboardingView(
            challengeViewModel: ChallengeViewModel(),
            userViewModel: UserViewModel(),
            reminderViewModel: ReminderViewModel(rappels: [Reminder(titre: "Math à 14h", description: "Je dois travailler le théoreme de pythagore", date: Date())]),
            rewardViewModel: RewardViewModel(userViewModel: UserViewModel()),
            goalViewModel: GoalViewModel(goals: [Goal(goalTitle: "Apprendre SwiftUI", startDate: startDate, endDate: endDate, goalDescription: "Suivre un cours en ligne pour maîtriser SwiftUI", isCompleted: false)])
        )
    }
}
