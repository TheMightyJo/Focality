//
//  Reminder.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import Foundation
class Reminder : Identifiable{
    var id: UUID
    var rappelTitle: String
    var rappelDate: Date
    var rappelDescription: String
    
    init(id: UUID, rappelTitle: String, rappelDate: Date, rappelDescription: String) {
        self.id = id
        self.rappelTitle = rappelTitle
        self.rappelDate = rappelDate
        self.rappelDescription = rappelDescription
    }
}
