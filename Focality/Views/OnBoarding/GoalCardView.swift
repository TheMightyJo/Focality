import SwiftUI

struct GoalCardView: View {
    let goal: Goal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(goal.goalTitle)
                .font(.headline)
                .foregroundColor(.accentColor)
            Text("Fin: \(goal.endDate)")
                .font(.subheadline)
                .foregroundColor(.white)
            
            if goal.isCompleted {
                Text("Completé")
                    .font(.caption)
                    .foregroundColor(.green)
            } else {
                Text("En cours")
                    .font(.caption)
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

struct GoalCardView_Previews: PreviewProvider {
    static var previews: some View {
        GoalCardView(goal: Goal(goalTitle: "Apprendre SwiftUI", startDate: "01/08/2024", endDate: "31/08/2024", goalDescription: "Suivre un cours en ligne pour maîtriser SwiftUI", isCompleted: false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
