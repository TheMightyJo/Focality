//
//  FocusHeartCoherenceModal.swift
//  Focality
//
//  Created by Apprenant 142 on 05/08/2024.
//

import SwiftUI


struct FocusHeartCoherenceModal: View {

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 42)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.secondaire, ]), startPoint: .top, endPoint: .bottom))
                
        }
    }
}

#Preview {
    FocusHeartCoherenceModal()
    
}
