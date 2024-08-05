//
//  FocusHeartCoherenceTimer.swift
//  Focality
//
//  Created by Apprenant 142 on 01/08/2024.
//

import SwiftUI

struct FocusHeartCoherenceTimer: View {
    @State private var timeRemaining = 3
    @State private var selectedDuration: Double = 0.00
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
    
        VStack{
                
            Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 30)
            
            Text("Focus")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 30))
                    .padding(.bottom, 60)
            
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [Color.primaire ,.secondaire, Color.secondaire.opacity(10)]),
                                        center: .center,
                                        startRadius: 5,
                                        endRadius: 200
                                    )
                                )
                                .frame(width: 200, height: 200)
                                .padding(.bottom, 30)
                
                                .onReceive(timer) { time in
                                    if timeRemaining > 0 {
                                        timeRemaining -= 1
                                    }
                                }
            Text(" \(timeRemaining)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .padding(.bottom, 30)
            
            Button {
                    
            } label: {
                Image("PlayFocusHeartCoherence")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .padding(.bottom, 10)
            }
            
            HStack {
                    Text("0:00")
                    Slider(value: $selectedDuration, in: 0...5, step: 0.1)
                    Text("5:00")
                    }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 70)
        }
    }
}

#Preview {
    FocusHeartCoherenceTimer()
}
