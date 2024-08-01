//
//  FocusHeartCoherenceTimer.swift
//  Focality
//
//  Created by Apprenant 142 on 01/08/2024.
//

import SwiftUI

struct FocusHeartCoherenceTimer: View {
    var body: some View {
        VStack{
            HStack{Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)}
            
            HStack{Text("Focus")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 30))}
            HStack{
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [Color.primaire ,.secondaire, Color.secondaire.opacity(10)]),
                                        center: .center,
                                        startRadius: 5,
                                        endRadius: 200
                                    )
                                )
                                .frame(width: 200, height: 200)
                
                
            }
        }
    }
}

#Preview {
    FocusHeartCoherenceTimer()
}
