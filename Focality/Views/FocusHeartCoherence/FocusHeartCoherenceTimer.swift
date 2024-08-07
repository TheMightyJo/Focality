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
    @State private var navigateBreathOut = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
    
        NavigationStack{
            VStack(alignment: .center){
                
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
                        }else{
                            navigateBreathOut = true
                        }
                    }
                Text(" \(timeRemaining)")
                    .font(.system(size: 60))
                    .foregroundStyle(.black)
                 
                
              
                
                
                NavigationLink(destination : FocusHeartCoherenceBreathInBreathOut(), isActive: $navigateBreathOut){
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    FocusHeartCoherenceTimer()
}
