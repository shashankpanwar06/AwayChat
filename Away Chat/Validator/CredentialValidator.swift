//
//  File.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 18/10/20.
//

import Foundation



struct CredentialValidator {
    
    
    func validate(credentials:SignUpRequest)->ValidatorResponse{
        
        if credentials.email.isEmpty{
            return ValidatorResponse(success: false, error: "Please Enter valid email!")
        }
        
        if credentials.password.isEmpty{
            return ValidatorResponse(success: false, error: "User Password is Empty!")
        }
    
        return ValidatorResponse(success: true, error: nil)
        
    }
    
    
}//.

