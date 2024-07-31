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
            
            HStack{
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
            
            }
            
            HStack{
                Text("Focus")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 30))
            }
            
            HStack{
                Image("Focus")
                    .resizable()
                    .frame(width: 200, height: 200)
            
            }
            
            HStack{
                Text("breathing focus")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
            }
            
            HStack{
                Text("5 min")
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
            }
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondaire)
                    .frame(width: 300, height: 50)
                Button(action: {
                    }, label:{
                        Text("Commencer")})
                .foregroundColor(.white)
                
            }
           
        
            TabView{
                
            }
        }
    }
}

#Preview {
    FocusHeartCoherence()
}
