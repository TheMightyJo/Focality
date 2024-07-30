//
//  GoalViewController.swift
//  Focality
//
//  Created by Apprenant 165 on 30/07/2024.
//

import UIKit

class GoalViewController: UIViewController {
    
    @IBOutlet weak var labelTitre: UILabel!
    
    @IBOutlet weak var labelQuelObjectif: UILabel!
    @IBOutlet weak var textFieldObjectif: UITextField!
    @IBOutlet weak var labelPeriodeDeTemps: UILabel!
    @IBOutlet weak var textFieldPeriodeDeTemps: UITextField!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var textFieldDescription: UITextField!
    @IBOutlet weak var buttonAjouter: UIButton!
    
    var objectif : Goal = Goal(goalTitle: "", startDate: Date(), endDate: Date(), goalDescription: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        labelQuelObjectif.text = objectif.goalTitle
      
    }
}
