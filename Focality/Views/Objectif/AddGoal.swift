import SwiftUI

struct AddGoal: View {
    @ObservedObject var goalViewModel: GoalViewModel
    @State private var goalTitle = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var goalDescription = ""
    @State private var isCompleted = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Détails de l'objectif")) {
                    TextField("Titre de l'objectif", text: $goalTitle)
                    DatePicker("Date de début", selection: $startDate, displayedComponents: .date)
                    DatePicker("Date de fin", selection: $endDate, displayedComponents: .date)
                    TextField("Description de l'objectif", text: $goalDescription)
                    Toggle("Complété", isOn: $isCompleted)
                }
                
                Button(action: {
                    goalViewModel.addGoal(
                        goalTitle: goalTitle,
                        startDate: startDate,
                        endDate: endDate,
                        goalDescription: goalDescription,
                        isCompleted: isCompleted
                    )
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Ajouter l'objectif")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Nouvel Objectif", displayMode: .inline)
        }
    }
}

struct AddGoal_Previews: PreviewProvider {
    static var previews: some View {
        AddGoal(goalViewModel: GoalViewModel())
    }
}
