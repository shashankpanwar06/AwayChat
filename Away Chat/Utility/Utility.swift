//
//  Utility.swift
//  Away Chat
//
//  Created by Kirti Ahlawat on 29/10/20.
//

import Foundation
import UIKit

class Utility{
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func alert(title : String, message : String, vc : UIViewController, dissmissAfter : Int? = nil){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let second = dissmissAfter{
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(second)) {
                vc.dismiss(animated: true)
            }
        }
        vc.present(alertVC, animated: true)
    }
    
}
