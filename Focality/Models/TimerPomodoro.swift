//
//  Timer.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import Foundation

class Timer: Identifiable{
    var id = UUID()
    var focusTime:  Int
    var shortBreak : Int
    var longBreak : Int
    
    init(id: UUID = UUID(), focusTime: Int, shortBreak: Int, longBreak: Int) {
        self.id = id
        self.focusTime = focusTime
        self.shortBreak = shortBreak
        self.longBreak = longBreak
    }
    
}
