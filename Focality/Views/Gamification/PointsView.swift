//
//  PointsView.swift
//  Focality
//
//  Created by Johan Quille on 20/07/2024.
//

import SwiftUI

struct PointsView: View {
    @ObservedObject var userViewModel: UserViewModel

    var body: some View {
        if let user = userViewModel.users.first {
            HStack {
                Text("Points : ")
                    .font(.subheadline).bold()
                    .foregroundStyle(.white)
                Text("\(user.point)")
                    .font(.subheadline).bold()
                    .foregroundColor(.accent)
            }
        }
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(userViewModel: UserViewModel())
    }
}
