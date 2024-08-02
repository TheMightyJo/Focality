//
//  FocusHeartCoherence.swift
//  Focality
//
//  Created by Apprenant 142 on 31/07/2024.
//

import SwiftUI

struct FocusHeartCoherence: View {
    var body: some View {
        VStack{
            
            
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 10)
            
                   
            
                Text("Focus")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 30))
                    .padding(.bottom, 70)
        
            
            
                Image("Focus")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 40)
            
            
            
            
                Text("breathing focus")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.bottom, 30)
            
            
            
                Text("5 min")
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                    .padding(.bottom, 20)
            
            
                Button(action: {
                }, label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.secondaire)
                            .frame(width: 300, height: 50)
                        Text("Commencer")
                            .foregroundColor(.white)
                    }})
                
            
           
        
            TabView{
                
            }
        }
    }
}

#Preview {
    FocusHeartCoherence()
}
