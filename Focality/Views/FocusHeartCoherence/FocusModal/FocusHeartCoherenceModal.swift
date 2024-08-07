//
//  FocusHeartCoherenceModal.swift
//  Focality
//
//  Created by Apprenant 142 on 05/08/2024.
//

import SwiftUI


struct FocusHeartCoherenceModal: View {
    @ObservedObject  var viewModelsFocus : ViewModelsFocus
    @State var temps = 0
    @State var objectif = 0
    @State var nombreDePoint = 0
    
 
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 42)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.secondaire, .gray]), startPoint: .top, endPoint: .bottom))
            
            
            
            VStack{
//                
                Focus()
//                Text("Félicitation ")
//                    
//                    .fontWeight(.semibold)
//                    .font(.system(size: 20))
//                    .padding(.bottom,100)
//                    .foregroundColor(.white)
//                    .padding(.top, 50)
//                
//                
//                Text("Vous venez de terminer la séance \n Respiration Focus !")
//                    
//                    .fontWeight(.regular)
//                    .font(.system(size: 14))
//                    .padding(.bottom,100)
//                    .foregroundColor(.white)
//                    .frame(alignment: .center)
//                
                    List{
                    
                        HStack{
                            VStack{
                                Text("TEMPS")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                                TextField("Temps", value: $temps, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                
                            }
                            
                            VStack{
                                Text("POINTS")
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                                TextField("Nombre de points", value: $nombreDePoint, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                            }
                            
                            VStack{
                                Text("OBJECTIF")
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                                TextField("Temps", value: $temps, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                            }
                        }
                       
                        .listRowBackground(Color.clear)
                    }
                
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    
                
                Text("Vous avez été guidés par ")
                    .fontWeight(.semibold)
                    .font(.system(size: 10))
                    .padding(.bottom,100)
                    .foregroundColor(.white)
                
                Text("Focality")
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                    .padding(.bottom, 50)
                    .foregroundColor(.white)
                
                Button(action: {
                }, label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.orange)
                            .frame(width: 200, height: 50)
                        Text("Merci")
                            .foregroundColor(.white)
                            
                    }})
                .padding(.bottom, 50)
            }
            
            }
            
           
    }
}

#Preview {
    FocusHeartCoherenceModal(viewModelsFocus : ViewModelsFocus())
    
}

struct Focus: UIViewControllerRepresentable{
    
    func makeUIViewController(context: Context) -> some FocusViewController {
        guard let focusVC = UIStoryboard(name: "FocusMain", bundle: .main).instantiateViewController(identifier: "FocusViewController") as? FocusViewController else{
            fatalError("canot instanciate FocusViewController")
        }
       
        return focusVC
            
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // nothink to do
    }
}
