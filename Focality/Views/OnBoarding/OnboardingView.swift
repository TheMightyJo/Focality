import SwiftUI

struct OnboardingView: View {
    @ObservedObject var challengeViewModel: ChallengeViewModel
    @ObservedObject var timerViewModel: TimerViewModel
    @ObservedObject var authViewModel: AuthViewModel
    @ObservedObject var userViewModel: UserViewModel
    @ObservedObject var reminderViewModel: ReminderViewModel
    @ObservedObject var rewardViewModel: RewardViewModel
    @ObservedObject var goalViewModel: GoalViewModel
    @State private var showingAddGoalView = false
    @State private var showingSettingModalView = false
    @State private var showingAddReminderView = false
    
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
                        if let user = userViewModel.users.first {
                            Text("Mes Points : \(user.point)")
                                .font(.title2).bold()
                                .foregroundStyle(.accent)
                        }
                    }
                    Image("ProfilePicture")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                }
                
                HStack {
                    NavigationLink(destination: GoalView()) {
                        Text("🎯 Mes Objectifs")
                            .font(.title2).bold()
                            .foregroundStyle(.text)
                    }
                    Spacer()
                }
                .padding()
                
                GamificationCardView(rewardViewModel: rewardViewModel, userViewModel: userViewModel)
                
                Divider().padding(.vertical)
                
                HStack {
                    NavigationLink(destination: GoalView()) {
                        Text("🎯 Mes Objectifs")
                            .font(.title2).bold()
                            .foregroundStyle(.text)
                    }
                    Spacer()
                    Button(action: {
                        showingAddGoalView = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.accent)
                    }
                    .sheet(isPresented: $showingAddGoalView) {
                        AddGoal(viewModel: goalViewModel)
                    }
                }
                .padding(.horizontal)
                
                
                if goalViewModel.goals.count >= 1 {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(goalViewModel.goals) { goal in
                                NavigationLink(destination: GoalDetailView(goal: goal)) {
                                    GoalCardView(goal: goal)
                                }
                            }
                        }
                    }
                    
                    .padding(.horizontal)
                } else {
                    Text("Pas d'objectifs disponibles 🤷")
                        .font(.title2)
                        .padding()
                }
            }
            
            Divider().padding(.vertical)
            
            HStack {
                NavigationLink(destination: TimerView()) {
                    Text("⏰ Mes Timers")
                        .font(.title2).bold()
                        .foregroundStyle(.text)
                }
                Spacer()
                Button(action: {
                    showingSettingModalView = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.accent)
                }
                .sheet(isPresented: $showingSettingModalView) {
                    SettingModalView(viewModel: TimerViewModel( isRunning: false))
                }
            }
            .padding(.horizontal)
            
            Text("Pas de timers disponibles 🤷")
                .font(.title2)
                .padding()
            
            Divider().padding(.vertical)
            
            HStack {
                NavigationLink(destination: ReminderView()) {
                    Text("✔️ Mes Rappels")
                        .font(.title2).bold()
                        .foregroundStyle(.text)
                }
                Spacer()
                Button(action: {
                    showingAddReminderView = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.accent)
                }
                .sheet(isPresented: $showingAddReminderView) {
                    AddReminderView(viewModel: reminderViewModel) {
                        showingAddReminderView = false
                    }
                }
            }
            .padding(.horizontal)
            
            if reminderViewModel.rappels.count >= 1 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(reminderViewModel.rappels.prefix(4)) { reminder in
                            ReminderCardView(reminder: reminder)
                        }
                    }
                }
                .padding(.horizontal)
            } else {
                Text("Pas de rappels disponibles 🤷")
                    .font(.title2)
                    .padding()
            }
            
            NavigationLink(destination: AuthView(userViewModel: UserViewModel())
                .navigationBarBackButtonHidden(true)
            ) {
                Text("Se déconnecter")
                    .font(.title2).bold()
                    .foregroundColor(.red)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
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
            challengeViewModel: ChallengeViewModel(), timerViewModel: TimerViewModel( isRunning: false), authViewModel: AuthViewModel(userViewModel: UserViewModel()),
            userViewModel: UserViewModel(),
            reminderViewModel: ReminderViewModel(rappels: [Reminder(titre: "Math à 14h", description: "Je dois travailler le théoreme de pythagore", date: Date())]),
            rewardViewModel: RewardViewModel(userViewModel: UserViewModel()),
            goalViewModel: GoalViewModel(goals: [Goal(goalTitle: "Apprendre SwiftUI", startDate: startDate, endDate: endDate, goalDescription: "Suivre un cours en ligne pour maîtriser SwiftUI", isCompleted: false)])
        )
    }
}
