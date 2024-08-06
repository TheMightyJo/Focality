//
//  GoalViewController.swift
//  Focality
//
//  Created by Apprenant 165 on 30/07/2024.
//

import UIKit

class GoalViewController: UIViewController {
    
    @IBOutlet weak var titreObjectif: UILabel!
    @IBOutlet weak var objectifCompleter: UIImageView!
    @IBOutlet weak var descriptionObjectif: UITextView!
    var objectif : Goal = Goal(goalTitle: "", startDate: Date(), endDate: Date(), goalDescription: "", isCompleted: Bool())
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
