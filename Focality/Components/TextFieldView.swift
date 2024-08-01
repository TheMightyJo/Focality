import SwiftUI

struct TextFieldView: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        ZStack {
            if isSecure && !isPasswordVisible {
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
            }
            if isSecure {
                HStack {
                    Spacer()
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.secondary)
                    }
                    .padding(.trailing, 16)
                }
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(placeholder: "Password", text: .constant(""), isSecure: true)
    }
}
