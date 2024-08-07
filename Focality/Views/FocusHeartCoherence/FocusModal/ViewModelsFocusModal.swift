//
//  ViewModelsFocusModal.swift
//  Focality
//
//  Created by Apprenant 142 on 06/08/2024.
//

import SwiftUI

class ViewModelsFocus: ObservableObject{
    @Published var focusModals: [FocusModal] = []
    init() {
        self.focusModals = [
            FocusModal(temps: 5, objectif: 2, nombreDePoint: 150)
            
        ]
    }
}
