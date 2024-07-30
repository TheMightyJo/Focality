//
//  TimerViewModel.swift
//  Focality
//
//  Created by Apprenant 154 on 18/07/2024.
//

import SwiftUI

class TimerViewModel: ObservableObject{
    @Published var timers: Timer
    init() {
        self.timers = Timer(focusTime: 25, shortBreak: 5, longBreak: 15)
    }
    func modifTimer(focusTime: Int, shortBreak: Int, longBreak: Int){
        let newTimer = Timer(focusTime: focusTime, shortBreak: shortBreak, longBreak: longBreak)
    }
}
 
