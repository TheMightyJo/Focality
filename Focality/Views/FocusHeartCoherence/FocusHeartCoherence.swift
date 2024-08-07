import SwiftUI

struct FocusHeartCoherence: View {
    @State private var selectedDuration: Int = 5
    @ObservedObject var userViewModel: UserViewModel
    var user: User

    var body: some View {
<<<<<<< Updated upstream
        NavigationStack{
            VStack{
                
                
=======
        NavigationStack {
            VStack {
>>>>>>> Stashed changes
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 10)
<<<<<<< Updated upstream
                
                
                
=======
>>>>>>> Stashed changes
                Text("Focus")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .padding(.bottom, 70)
<<<<<<< Updated upstream
                
                
                
=======
>>>>>>> Stashed changes
                Image("Focus")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 40)
<<<<<<< Updated upstream
                
                
                
                
                Text("breathing focus")
=======
                Text("Breathing Focus")
>>>>>>> Stashed changes
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.bottom, 30)
                
<<<<<<< Updated upstream
                
                
                Text("5 min")
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                    .padding(.bottom, 20)
                
                
                NavigationLink(destination:FocusHeartCoherenceTimer()){
                    ZStack{
=======
                // Sélecteur de durée
                Picker("Durée", selection: $selectedDuration) {
                    ForEach(1..<6) { minute in
                        Text("\(minute) minutes").tag(minute)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding(.horizontal)
                .padding(.bottom, 30)
                
                NavigationLink(destination: FocusHeartCoherenceTimer(duration: selectedDuration, userViewModel: userViewModel, user: user)) {
                    ZStack {
>>>>>>> Stashed changes
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.secondaire)
                            .frame(width: 300, height: 50)
                        Text("Commencer")
                            .foregroundColor(.white)
                    }
                }
<<<<<<< Updated upstream
                
                
                
                TabView{
                    
                }
=======
>>>>>>> Stashed changes
            }
        }
    }
}

#Preview {
    FocusHeartCoherence(userViewModel: UserViewModel(), user: User(firstName: "John", lastName: "Doe", email: "john.doe@example.com", password: "password", birthday: Date(), point: 0, currentLevel: 0))
}
