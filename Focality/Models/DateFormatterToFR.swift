//
//  DateFormatterToFR.swift
//  Focality
//
//  Created by Apprenant 165 on 13/09/2024.
//

import Foundation
/// Cette classe respecte le premier principe de SOLID (SRP) car elle n'a qu'une seule responsabilité, elle formatte la date et la transforme en format americain. 
class DateFormatterToFR: ObservableObject {
    
    func dateFormatter(from dateString: String) -> String? {
         let fromFormatter = DateFormatter()
         fromFormatter.dateFormat = "dd/MM/yyyy"

         let toFormatter = DateFormatter()
         toFormatter.dateFormat = "MM-dd-yyyy"

         guard let date = fromFormatter.date(from: dateString) else { return nil }

         return toFormatter.string(from: date)
       }
    
}
