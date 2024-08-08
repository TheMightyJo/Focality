//
//  FocusViewController.swift
//  Focality
//
//  Created by Apprenant 142 on 06/08/2024.
//

import UIKit

/// FocusViewController est une sous-classe de UIViewController qui gère l'affichage et l'interaction avec une interface utilisateur.
/// Cette classe est associée à un storyboard contenant des éléments d'interface utilisateur tels qu'un label, un champ de texte, et une image.
class FocusViewController : UIViewController{
    
/// Label pour afficher du texte statique ou dynamique.
    @IBOutlet weak var labelView: UILabel!
/// Champ de texte pour permettre à l'utilisateur de saisir ou de visualiser du texte.
    @IBOutlet weak var textView: UITextView!
/// Vue d'image pour afficher une image.
    @IBOutlet weak var imageView: UIImageView!
    
/// Méthode appelée après le chargement de la vue en mémoire.
        
/// Cette méthode est utilisée pour effectuer des configurations supplémentaires après le chargement initial de la vue.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


