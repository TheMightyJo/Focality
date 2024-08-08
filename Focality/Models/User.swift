import Foundation
import SwiftUI

class User: Identifiable, ObservableObject {
    @Published var id: UUID
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var password: String
    @Published var birthday: Date
    @Published var point: Int
    @Published var currentLevel: Int
    @Published var image: UIImage? // Ajoutez cette propriété si vous souhaitez stocker une image

    init(firstName: String, lastName: String, email: String, password: String, birthday: Date, point: Int, currentLevel: Int, image: UIImage? = nil) {
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.birthday = birthday
        self.point = point
        self.currentLevel = currentLevel
        self.image = image
    }
}
