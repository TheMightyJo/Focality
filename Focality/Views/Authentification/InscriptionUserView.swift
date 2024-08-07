//
//  inscriptionUserView.swift
//  Focality
//
//  Created by Apprenant 142 on 19/07/2024.
//

import SwiftUI
/// La vue InscriptionUserView permet aux utilisateurs de s'inscrire en entrant leurs informations personnelles.
/// Elle utilise le modèle de vue UserViewModel pour gérer les données utilisateur.
struct InscriptionUserView : View {
/// Le modèle de vue utilisé pour gérer les utilisateurs.
    @ObservedObject  var userViewModel : UserViewModel
/// Propriétés d'état pour stocker les entrées utilisateur.
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var birthday = Date()
    @State private var point = 0
    @State private var currentLevel = 0
   
    var body: some View {

        
        VStack{
    /// Titre 'inscription.
                Text("Inscription")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 30))
                    .padding(.trailing, 200)
                
/// Logo de l'application.
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
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
                    
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
//                HStack{
//                    Text("Points")
//                    TextField("Points", value: $point, formatter: NumberFormatter())
//                    .keyboardType(.numberPad)
//                    .padding()
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//               
//                HStack{
//                    Text("Current Level")
//                    TextField("Current Level", value: $currentLevel, formatter: NumberFormatter())
//                    .keyboardType(.numberPad)
//                    .padding()
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaire)
                        .frame(width: 300, height: 50)
                    Button(action: {userViewModel.addUser(firstName: firstName, lastName: lastName, email: email, password: password, birthday: birthday)
                        }, label:{
                            Text("Création")})
                    .foregroundColor(.black)

                    .font(.custom("arial", size: 30))
                }
               
                
            }
            
           
            .scrollContentBackground(.hidden)
            
        }
        
        
       
                
            
        
    }
}

#Preview {
    InscriptionUserView(userViewModel: UserViewModel())
}

