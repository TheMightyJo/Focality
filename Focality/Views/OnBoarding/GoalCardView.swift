import SwiftUI

struct GoalCardView: View {
    let goal: Goal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(goal.goalTitle)
                .font(.headline)
                .foregroundColor(.accentColor)
            Text("Fin : \(goal.endDate, formatter: dateFormatter)")
                .font(.subheadline)
                .foregroundColor(.white)
            
            if goal.isCompleted {
                Text("Completé")
                    .font(.caption).bold()
                    .foregroundColor(.green)
            } else {
                Text("En cours")
                    .font(.caption).bold()
                    .foregroundColor(.white)
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.secondaire)
        .cornerRadius(10)
        .frame(width: UIScreen.main.bounds.width - 40)
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()

struct GoalCardView_Previews: PreviewProvider {
    static var previews: some View {
        GoalCardView(goal: Goal(goalTitle: "Apprendre SwiftUI", startDate: Date(), endDate: Date(), goalDescription: "Suivre un cours en ligne pour maîtriser SwiftUI", isCompleted: false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
