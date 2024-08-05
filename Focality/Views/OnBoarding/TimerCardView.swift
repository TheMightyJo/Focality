import SwiftUI

struct TimerCardView: View {
    @ObservedObject var timerViewModel: TimerViewModel
    let focusTime: Int
    @State private var navigateToTimerView = false
    
    var body: some View {
        VStack(spacing: 11.0) {
            NavigationLink(destination: TimerView(viewModel: timerViewModel), isActive: $navigateToTimerView) {
                EmptyView()
            }
            Image(systemName: "play.circle.fill")
                .font(.system(size: 80))
            Button(action: {
                timerViewModel.updateTimer(focusTime: focusTime, shortBreak: 5, longBreak: 15)
                timerViewModel.setCurrentTime()
                navigateToTimerView = true
            }) {
                Text("\(focusTime) minutes")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.secondary)
        .cornerRadius(20)
    }
}

struct TimerCardView_Previews: PreviewProvider {
    static var previews: some View {
        TimerCardView(timerViewModel: TimerViewModel(isRunning: false, currentTime: 0), focusTime: 60)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
