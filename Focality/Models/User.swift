import Foundation
import SwiftUI

struct User: Identifiable, Codable {
     var id: String
     var firstName: String
     var lastName: String
     var email: String
     var password: String
     var birthDate: String
     var points: Int
     var currentLevel: Int
}
