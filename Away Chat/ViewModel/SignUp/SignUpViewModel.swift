//
//  SignUpViewModel.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 18/10/20.
//

import Foundation


struct SignUpViewModel {
    
    
    func signUpNewUser(credentials:SignUpRequest){
        
        let validatorResponse = CredentialValidator().validate(credentials: credentials)
        
        if validatorResponse.success{
            print("Succces")
        }else{
            print(validatorResponse.error)
        }
        
    }
    
    
    
}//.
