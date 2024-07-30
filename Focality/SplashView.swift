import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            if isActive {
                ContentView() // Remplacez par votre vue principale
            } else {
                VStack {
                    Image("Logo") // Remplacez par le nom de votre image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                .onAppear {
                    withAnimation(.easeIn(duration: 2.0)) {
                        self.isActive = true
                    }
                }
            }
        }
        .background(Color.white) // Couleur de fond de votre splash screen
        .edgesIgnoringSafeArea(.all)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
