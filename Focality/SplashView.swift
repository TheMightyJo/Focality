import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            if isActive {
                AuthView(userViewModel: UserViewModel())
            } else {
                VStack {
                    Image("Logo")
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
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
