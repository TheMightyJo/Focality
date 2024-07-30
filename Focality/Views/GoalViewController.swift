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
        @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var textFieldDescription: UITextField!
    @IBOutlet weak var buttonAjouter: UIButton!
    @IBOutlet weak var textFieldEndDate: UITextField!
    @IBOutlet weak var textFieldStartDate: UITextField!
    var objectif : Goal = Goal(goalTitle: "", startDate: "", endDate: "", goalDescription: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        textFieldObjectif.text = objectif.goalTitle
        textFieldStartDate.text = objectif.startDate
        textFieldEndDate.text = objectif.endDate
      
    }
}
