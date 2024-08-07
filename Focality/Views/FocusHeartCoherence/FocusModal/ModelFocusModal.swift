//
//  ModelFocusModal.swift
//  Focality
//
//  Created by Apprenant 142 on 06/08/2024.
//

import SwiftUI

class FocusModal: Identifiable {
    @Published var temps : Int
    @Published var objectif: Int
    @Published  var nombreDePoint: Int
    init(temps: Int, objectif: Int, nombreDePoint: Int) {
        self.temps = temps
        self.objectif = objectif
        self.nombreDePoint = nombreDePoint
    }
}

