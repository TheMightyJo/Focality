import Foundation
import SwiftUI

struct User: Identifiable, Codable {
     var id: String
     var firstName: String
     var lastName: String
     var email: String
     var password: String
     var birthday: Date
     var point: Int
     var currentLevel: Int
}
