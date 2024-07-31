//
//  ReminderView.swift
//  Focality
//
//  Created by Apprenant 178 on 30/07/2024.
//

import SwiftUI

struct ReminderView: View {
    @ObservedObject var reminder : ReminderViewModel
    
    var body: some View {
        
        VStack{
            
            
            HStack{
                Text("Rappels")
                    .bold()
                    .font(.system(size: 30))
                    .padding(.leading, 25)
                    
                Spacer()
                Image("Logo")
                    .resizable()
                        .frame(width: 120.0, height: 120.0)
                        .padding(.trailing, 35)
            }
        }
    }
}

#Preview {
    ReminderView(reminder: ReminderViewModel())
}
