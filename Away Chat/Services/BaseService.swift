//
//  BaseService.swift
//  Away Chat
//
//  Created by Kirti Ahlawat on 26/10/20.
//

import Foundation
import Alamofire
import UIKit

enum APISuccessStatus : Int{
    case failure = 0
    case success = 1
}

class BaseService : NSObject{
    
    func serviceRequest(type : HTTPMethod, serviceType : ServiceConstants.ServiceType, parameters : Parameters, headers : HTTPHeaders? = nil, image : [UIImage]? = nil, completion: @escaping (Data?) -> ()){
        print(serviceType.apiUrl)
        print("Parameters for \(serviceType): \(parameters)")
//        ActivityIndicator.shared().show("Waiting For Data")
        if type == HTTPMethod.post{
            if image != nil{
//                guard let images = image else {return}
//                var updateParameter = parameters
//                updateParameter["file"] = images
//                AF.upload(multipartFormData: { (multipartFormData) in
//                    for (key, value) in updateParameter{
//                        if key == "file"{
//                            guard let imagesNeedToBeUpload = value as? [UIImage] else {return}
//                            for image in imagesNeedToBeUpload{
//                                if let imageData = image.jpegData(compressionQuality: 0.5){
//                                    print("File Name : IMG_\(Date().currentTimestamp()).jpg")
//                                    multipartFormData.append(imageData, withName: key, fileName: "IMG_\(Date().currentTimestamp()).jpg", mimeType: "image/jpeg")
//                                }
//                            }
//                        }else{
//                            multipartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
//                        }
//                    }
//                },
//                                 to: serviceType.apiUrl, headers : headers) { (encodingResult) in
//
//                                    switch encodingResult{
//                                    case .success(let upload, _, _):
//                                        upload.uploadProgress(closure: { (progress) in
//                                            let percentage = round(progress.fractionCompleted * 100)
//                                            let stringRepresntation = NSString(format: "%.0f", percentage)
//                                            ActivityIndicator.shared().updateProgressText(progreess: "\(stringRepresntation)%")
//                                        })
//                                        upload.responseJSON(completionHandler: { (response) in
//                                            ActivityIndicator.shared().hide()
//                                            switch response.result{
//                                            case .success(let result):
//                                                if let jsonDict = result as? [String : Any]{
//                                                    if let successStatus = jsonDict["success"] as? Bool{
//                                                        if successStatus{
//                                                            completion(response.data)
//                                                        }else{
//                                                            self.displayAlertAfterSuccessFalse(jsonDict: jsonDict)
//                                                        }
//                                                    }
//                                                }
//                                            case .failure(let error):
//                                                 AlertService().showAlert(title: "Alert", message: error.localizedDescription, actionButtonTitle: "Ok", completion: {})
//                                            }
//                                        })
//                                    case .failure(let error):
//                                        print(error)
////                                        ActivityIndicator.shared().hide()
////                                        AlertService().showAlert(title: Constants.alert.alertType, message: error.localizedDescription, actionButtonTitle: Constants.alert.actionBtnType)
//                                    }
//                }
            }else{
                
                AF.request(serviceType.apiUrl, method: type, parameters: parameters, encoding : JSONEncoding.default, headers: headers).validate().responseJSON { [weak self] (response) in
                    guard let _ = self else {return}
//                    ActivityIndicator.shared().hide()
                    switch response.result{
                    case .success(let result):
                        if let jsonDict = result as? [String : Any]{
                            print("Response for \(serviceType): \(jsonDict)")
                            completion(response.data)
//                            if let successStatus = jsonDict["success"] as? Bool{
//                                if successStatus{
//                                    completion(response.data)
//                                }else{
//                                    self.displayAlertAfterSuccessFalse(jsonDict: jsonDict)
//                                }
//                            }
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
//                        AlertService().showAlert(title: "Alert", message: error.localizedDescription, actionButtonTitle: "Ok", completion: {})
                    }
                }
            }
        }
        
        if type == HTTPMethod.get{
            AF.request(serviceType.apiUrl, method: type, parameters: parameters, headers: headers).validate().responseJSON { [weak self] (response) in
                guard let self = self else {return}
//                ActivityIndicator.shared().hide()
                switch response.result{
                case .success(let result):
                    if let jsonDict = result as? [String : Any]{
                        print("Response for \(serviceType): \(jsonDict)")
                        if let successStatus = jsonDict["success"] as? Bool{
                            if successStatus{
                                completion(response.data)
                            }else{
                                self.displayAlertAfterSuccessFalse(jsonDict: jsonDict)
                            }
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
//                    AlertService().showAlert(title: "Alert", message: error.localizedDescription, actionButtonTitle: "Ok", completion: {})
                }
            }
        }
        
//        if type == HTTPMethod.put{
//            AF.upload(multipartFormData: { (multipartFormData) in
//                for (key, value) in parameters{
//                    if let image = value as? UIImage{
//                        if let imageData = image.jpegData(compressionQuality: 0.2){
//                            multipartFormData.append(imageData, withName: key, fileName: "Image.jpg", mimeType: "image/jped")
//                        }
//                    }
//
//                }
//            },
//                             to: serviceType.apiUrl) { (encodingResult) in
//                                switch encodingResult{
//                                case .success(let upload, _, _):
//                                    upload.uploadProgress(closure: { (progress) in
//                                        print("Progress : \(progress)")
//                                    })
//                                    upload.responseJSON(completionHandler: { (response) in
//                                        print(response.result.value)
//                                        response.result.value
//                                    })
//                                case .failure(let error):
//                                    AlertService().showAlert(title: Constants.alert.alertType, message: error.localizedDescription, actionButtonTitle: Constants.alert.actionBtnType)
//                                }
//            }
//        }
    }
    
    private func displayAlertAfterSuccessFalse(jsonDict : [String : Any]){
        if let errorMessage = jsonDict["message"] as? String{
//            AlertService().showAlert(title: Constants.alert.alertType, message: errorMessage, actionButtonTitle: Constants.alert.actionBtnType)
        }
    }
    
}

