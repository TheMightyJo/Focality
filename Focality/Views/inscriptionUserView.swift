//
//  inscriptionUserView.swift
//  Focality
//
//  Created by Apprenant 142 on 19/07/2024.
//

import SwiftUI

struct inscriptionUserView : View {
    
    @ObservedObject  var userViewModel : UserViewModel
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var birthday = Date()
    @State private var point = 0
    @State private var currentLevel = 0
   
    var body: some View {

        VStack{
            HStack{
                Text("Inscription")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 30))
                Spacer()
                
            }
            
            
            HStack{
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            
        }
        
        HStack{
            List{
                HStack{
                    Text("FirstName")
                    TextField("FirstName", text: $firstName)
                     .padding()
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                }
               
                HStack{
                    Text("LastName")
                    TextField("LasttName", text: $lastName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
               
               
                HStack{
                    Text("Email")
                    TextField("Email", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack{
                    Text("Password")
                    TextField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack{
                    Text("Birthday")
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack{
                    Text("Points")
                    TextField("Points", value: $point, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
               
                HStack{
                    Text("Current Level")
                    TextField("Current Level", value: $currentLevel, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                
                Button(action: {userViewModel.addUser(firstName: firstName, lastName: lastName, email: email, password: password, birthday: birthday)
                    }, label:{
                        Text("Création")})
                .background(Color.primaire)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .font(.custom("arial", size: 30))
                
            }
                
            
        }
    }
}

#Preview {
    inscriptionUserView(userViewModel: UserViewModel())
}

