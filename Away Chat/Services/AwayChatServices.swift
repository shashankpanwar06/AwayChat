//
//  AwayChatServices.swift
//  Away Chat
//
//  Created by Kirti Ahlawat on 26/10/20.
//

import Foundation
import Alamofire

class AwayChatServices : BaseService{
    
    private override init() {}
    
    static let shared = AwayChatServices()
    
    func sendRequestForSignUp(parameters : Parameters, completion : @escaping (Bool, String) -> ()){
        let param = parameters.merging(getDeviceAppDetails(), uniquingKeysWith: { (_ , new) in new})
        let headers = getHeaderForAPIs()
        serviceRequest(type: .post, serviceType: .signUp, parameters: param, headers: headers) { (responseData) in
            do{
                if let responseDict = try JSONSerialization.jsonObject(with: responseData!, options: .mutableContainers) as? [String : Any]{
                    guard let mainResponseDict = responseDict["data"] as? [[String : Any]] else {return}
                    guard let message = responseDict["message"] as? String else {return}
                    guard let status = responseDict["success"] as? Bool else {return}
                    
                    if mainResponseDict.count > 0{
                        let mainResponseDictData = try JSONSerialization.data(withJSONObject: mainResponseDict as Any, options: .fragmentsAllowed)
                        let users = try JSONDecoder().decode([User].self, from: mainResponseDictData)
                        UserInfo.shared.info = users[0]
                        
                        let userData = try JSONEncoder().encode(users[0])
                        UserDefaults.standard.set(userData, forKey: "userInfo")
                        
                        let userFetchData = UserDefaults.standard.value(forKey: "userInfo")
                        let _ = try JSONDecoder().decode(User.self, from: userFetchData as! Data)
                    }
                    completion(status,message)
                }
            }catch (let error){
                if let _ = error as? DecodingError{
                    self.handlingDecodableErrors(error: error as! DecodingError)
                }
            }
        }
    }
    
    func sendRequestForSignIn(parameters : Parameters, compleion : @escaping (Bool, String) -> ()){
        let headers = getHeaderForAPIs()
        serviceRequest(type: .post, serviceType: .login, parameters: parameters, headers: headers) { (responseData) in
            do{
                if let responseDict = try JSONSerialization.jsonObject(with: responseData!, options: .mutableContainers) as? [String : Any]{
                    guard let mainResponseDict = responseDict["data"] as? [[String : Any]] else {return}
                    guard let message = responseDict["message"] as? String else {return}
                    guard let status = responseDict["success"] as? Bool else {return}
                    if status{
                        let mainResponseDictData = try JSONSerialization.data(withJSONObject: mainResponseDict as Any, options: .fragmentsAllowed)
                        let users = try JSONDecoder().decode([User].self, from: mainResponseDictData)
                        if users.count > 0{
                            UserInfo.shared.info = users[0]
                            
                            let userData = try JSONEncoder().encode(users[0])
                            UserDefaults.standard.set(userData, forKey: "userInfo")
                            
                            let userFetchData = UserDefaults.standard.value(forKey: "userInfo")
                            let _ = try JSONDecoder().decode(User.self, from: userFetchData as! Data)
                        }
                    }
                    compleion(status, message)
                }
            }catch (let error){
                if let _ = error as? DecodingError{
                    self.handlingDecodableErrors(error: error as! DecodingError)
                }
            }
        }
    }
    
    func sendRequestForForgotPassword(parameters : Parameters, completion : @escaping (Bool, String) -> ()){
        let headers = getHeaderForAPIs()
        serviceRequest(type: .post, serviceType: .forgotPassword, parameters: parameters, headers: headers) { (responseData) in
            do{
                if let responseDict = try JSONSerialization.jsonObject(with: responseData!, options: .mutableContainers) as? [String : Any]{
                    let _ = responseDict["data"] as? [[String : Any]]
                    guard let message = responseDict["message"] as? String else {return}
                    guard let status = responseDict["success"] as? Bool else {return}
                    completion(status, message)
                }
            }catch (let error){
                if let err = error as? DecodingError{
                    self.handlingDecodableErrors(error: err )
                }
            }
        }
    }
    
    func sendRequestForUsernameAvailability(parameters : Parameters, completion : @escaping (Bool, String) -> ()){
        let headers = getHeaderForAPIs()
        serviceRequest(type: .post, serviceType: .checkUsername, parameters: parameters, headers: headers) { (responseData) in
            do{
                if let responseDict = try JSONSerialization.jsonObject(with: responseData!, options: .mutableContainers) as? [String : Any]{
                    let _ = responseDict["data"] as? [[String : Any]]
                    guard let message = responseDict["message"] as? String else {return}
                    guard let status = responseDict["success"] as? Bool else {return}
                    completion(status, message)
                }
            }catch let error{
                if let err = error as? DecodingError{
                    self.handlingDecodableErrors(error: err )
                }
            }
        }
    }
    
    func sendRequestForGetBioList(completion : @escaping ([ProfileCategory]) -> ()){
        let headers = getHeaderForAPIs()
        serviceRequest(type: .get, serviceType: .getBioList, parameters: [:], headers: headers) { (responseData) in
            do{
                if let responseDict = try JSONSerialization.jsonObject(with: responseData!, options: .mutableContainers) as? [String : Any]{
                    let mainResponseDict = responseDict["data"] as? [[String : Any]]
                    let _ = responseDict["message"] as? String
                    let mainResponseDictData = try JSONSerialization.data(withJSONObject: mainResponseDict as Any, options: .fragmentsAllowed)
                    let profileCategories = try JSONDecoder().decode([ProfileCategory].self, from: mainResponseDictData)
                    completion(profileCategories)
                }
            }catch (let error){
                if let err = error as? DecodingError{
                    self.handlingDecodableErrors(error: err )
                }
            }
            
        }
    }
    
    
    private func handlingDecodableErrors(error : DecodingError){
        switch error {
        case .dataCorrupted(let context):
            print(context)
        case .keyNotFound(let key, let context):
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        case .valueNotFound(let value, let context):
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        case .typeMismatch(let type, let context):
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        default:
            print(error)
        }
    }
    
    
    //MARK:- DEVICE INFORMATION
    private func getDeviceAppDetails() -> [String : Any]{
        var deviceInfo = [String : Any]()
        deviceInfo["os"] = 0                   //DeviceInfo.systemName
        deviceInfo["osVersion"] = DeviceInfo.systemVersion
        deviceInfo["buildNo"] = Bundle.buildVersionNumber
        deviceInfo["buildVersion"] = Bundle.releasedVersionNumber
        deviceInfo["deviceName"] = DeviceInfo.devieName
        deviceInfo["deviceIdentifier"] = DeviceInfo.deviceId
        deviceInfo["deviceModel"] = DeviceInfo.deviceModel
        if let notificationToken = UserDefaults.standard.value(forKey: Constants.UserDeaultKeys.notificationToken) as? String{
            deviceInfo["notificationToken"] = notificationToken
        }
        return deviceInfo
    }
    
    //MARK:- HEADER INFORMATION
    private func getHeaderForAPIs() -> HTTPHeaders?{
        var header : HTTPHeaders = [:]
        header["client_secret"] = "63oVaqpOIfysnbgSQmHNCylvHfD7GB0ag9m3hApeibul9Lgd6d"
        return header
    }
}
