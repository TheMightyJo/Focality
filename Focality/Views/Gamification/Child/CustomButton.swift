//
//  CustomButton.swift
//  Focality
//
//  Created by Johan Quille on 20/07/2024.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .foregroundColor(.text)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Appuyer ici", backgroundColor: .blue, action: {
            print("Bouton appuyé")
        })
        .padding()
    }
}
