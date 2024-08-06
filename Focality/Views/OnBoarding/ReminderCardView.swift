import SwiftUI

struct ReminderCardView: View {
    let reminder: Reminder
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(reminder.titre)
                .font(.headline)
                .foregroundStyle(.accent)
            Text("Date: \(reminder.date, formatter: dateFormatter)")
                .font(.subheadline)
                .foregroundColor(.white)
            Text(reminder.description)
                .font(.body)
                .foregroundColor(.white)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.secondaire)
        .cornerRadius(10)
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
        ReminderCardView(reminder: Reminder(titre: "Math à 14h", description: "Je dois travailler le théoreme de pythagore", date: Date()))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
