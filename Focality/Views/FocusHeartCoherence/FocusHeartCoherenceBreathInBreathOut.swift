//
//  FocusHeartCoherenceBreathInBreathOut.swift
//  Focality
//
//  Created by Apprenant 142 on 01/08/2024.
//

import SwiftUI

struct FocusHeartCoherenceBreathInBreathOut : View {
    @State private var scale: CGFloat = 1.0
    @State private var isAnimating = false
    @State private var timeRemaining: Double = 300
    @State private var selectedDuration: Double = 300
    @State private var isTimerRuning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        VStack {
            HStack{Image("Logo")
                    .resizable()
                .frame(width: 100, height: 100)}
            Spacer()
            
            HStack{Text("Focus")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 30))}
            .padding(.bottom, 100)
            
            
            
            Circle()
                .fill(RadialGradient(gradient: Gradient(colors: [Color.primaire ,.secondaire, Color.secondaire.opacity(10)]),center: .center, startRadius: 5, endRadius: 200))
                .frame(width: 200, height: 200)
                .scaleEffect(scale)
                .onAppear{
                    if isTimerRuning{
                        
                        
                        
                        withAnimation(Animation.easeInOut(duration: 4.0).repeatForever(autoreverses: true)) {self.scale = 1.5}
                    }
                    
                }
                
                .onChange(of: isTimerRuning) {
                    running in
                    if running {
                        withAnimation(Animation.easeInOut(duration: 4.0).repeatForever(autoreverses: true)) {self.scale = 1.5}
                    }else{
                        withAnimation{
                            self.scale = 1.0
                        }
                    }
                }
                .padding(.bottom, 100)
            
            Button {
                if isTimerRuning{
                    isTimerRuning = false
                }else{
                    startTimer()
                }
                
            } label: {
                Image(systemName : isTimerRuning ?  "stop.fill" : "play.fill")
                    .resizable()
                    .foregroundColor(.secondaire)
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .padding(.bottom, 10)
                
                
                
            }
            
            HStack {
                Text("0:00")
                Slider(value: $selectedDuration, in: 0...300, step: 1)
                Text("5:00")
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 70)
            
        }.onReceive(timer)  { _ in
            guard isTimerRuning else {
                return
            }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }else{
                isTimerRuning = false
            }
        }
    }
        
    
    
    
    
    private func startTimer(){
        timeRemaining = selectedDuration
        isTimerRuning = true
    }
}

#Preview {
    FocusHeartCoherenceBreathInBreathOut()
}

