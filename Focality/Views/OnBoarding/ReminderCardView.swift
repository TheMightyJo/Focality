import SwiftUI

struct ReminderCardView: View {
    let reminder: Reminder
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15.0) {
            Image(systemName: "calendar")
                .font(.title)
            Text(reminder.rappelTitle)
                .font(.title2)
                .foregroundStyle(.accent)
            Text("\(reminder.rappelDate, formatter: dateFormatter)")
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.secondaire)
        .cornerRadius(10)
        .frame(width: 150, height: 200)
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

struct ReminderCardView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderCardView(reminder: Reminder(rappelTitle: "Math à 14h", rappelDate: Date(), rappelDescription: "Je dois travailler le théoreme de pythagore"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
