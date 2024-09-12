import SwiftUI

struct ChallengeRowView: View {
    @ObservedObject var userViewModel: UserViewModel
    let challenge: Challenge

    var body: some View {
        VStack(alignment: .leading, spacing: 11.0) {
            Image("Lotus")
                .resizable()
                .frame(width: 60, height: 60)
            Text(challenge.title)
                .font(.headline)
            Text(challenge.description)
                .font(.subheadline)
//            if let user = userViewModel.users.first {
//                PointsUIViewRepresentable(points: user.point)
//                    .frame(height: 20) // Adjust the frame as needed
//            }
        }
        .padding()
        .foregroundStyle(.white)
        .background(Color.secondaire)
        .cornerRadius(20)
    }
}

struct ChallengeRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeRowView(userViewModel: UserViewModel(), challenge: Challenge(title: "Terminer une séance de respiration/expiration", description: "Compléter une séance de respiration/expiration de 5 minutes.", isCompleted: false, points: 10))
    }
}
