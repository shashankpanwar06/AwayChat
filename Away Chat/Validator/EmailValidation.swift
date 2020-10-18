//
//  EmailValidation.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 18/10/20.
//

import Foundation



@propertyWrapper struct EmailWrapper {
    
    fileprivate var value:String
    
    var wrappedValue:String{
        
        get{
            return isValidEmail(value) ? value : String()
        }
        set{
            value = newValue
        }
    }
    
    init(_ emailValue:String) {
        value = emailValue
    }
    
    
   fileprivate func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}//.
