//
//  ServiceConstant.swift
//  Away Chat
//
//  Created by Shashank Panwar on 26/10/20.
//

import Foundation

struct ServiceConstants {
    
    private static func getBaseUrl() -> String{
        switch environment {
        case .development:
            return "http://18.191.67.98:3000/api/v1/"
        case .production:
            return "http://18.191.67.98:3000/api/v1/"
        }
    }
    
    enum ServiceType : String{
        case login
        case signUp
        case forgotPassword
        case checkUsername
        case getBioList
        
        var apiUrl : String{
            switch self {
            case .login:
                return "\(ServiceConstants.getBaseUrl())sign_in"
            case .signUp:
                return "\(ServiceConstants.getBaseUrl())sign_up"
            case .forgotPassword:
                return "\(ServiceConstants.getBaseUrl())forgot_password"
            case .checkUsername:
                return "\(ServiceConstants.getBaseUrl())username_check"
            case .getBioList:
                return "\(ServiceConstants.getBaseUrl())bio_list"
            }
        }
    }
    
}


