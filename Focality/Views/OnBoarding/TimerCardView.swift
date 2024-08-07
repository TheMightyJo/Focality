import SwiftUI

struct TimerCardView: View {
    let timerPomodoro: TimerPomodoro

    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text("Temps de focus : \(timerPomodoro.focusTime) minutes")
                .font(.subheadline)
                .foregroundColor(.white)
            Text("Pause courte : \(timerPomodoro.shortBreak) minutes")
                .font(.subheadline)
                .foregroundColor(.white)
            Text("Pause longue : \(timerPomodoro.longBreak) minutes")
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.secondary)
        .cornerRadius(10)
        .frame(width: 150, height: 200)
    }
}

struct TimerCardView_Previews: PreviewProvider {
    static var previews: some View {
        TimerCardView(timerPomodoro: TimerPomodoro(focusTime: 25, shortBreak: 5, longBreak: 15))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
