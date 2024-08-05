import SwiftUI

struct ReminderCardView: View {
    let reminder: Reminder
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(reminder.titre)
                .font(.headline)
            Text("Date: \(reminder.date, formatter: dateFormatter)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(reminder.description)
                .font(.body)
                .foregroundColor(.white)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(10)
        .frame(width: 150, height: 100) // Adjust the width and height as needed
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
