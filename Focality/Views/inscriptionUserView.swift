//
//  inscriptionUserView.swift
//  Focality
//
//  Created by Apprenant 142 on 19/07/2024.
//

import SwiftUI

struct inscriptionUserView : View {
    @StateObject var userViewModel = UserViewModel()
    
//    @ObservedObject  var userViewModel = UserViewModel()
    
//    var user = User(firstName: "Dembo", lastName: "Babar", email: "dembo@gmail.com", password: "Teamcook5*", birthday: Date(), point: 55, currentLevel: 150)
//    var firstName = ""
//    var lastName = ""
//    var email = ""
//    var password = ""
//    var birthday = Date()
//    var point = 0
//    var currentLevel = 0
   
    var body: some View {

        VStack{
            Text("Inscription")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 36))
            
            Image("Logo")
                .resizable()
                .frame(width: 200, height: 200)
        }
        
        
        HStack{
            List{
//                TextField(userViewModel.users,text: $firstName)
               
                
                
                
                
                
                    
                
            }
                
            
        }
    }
}

#Preview {
    inscriptionUserView(userViewModel: UserViewModel())
}
