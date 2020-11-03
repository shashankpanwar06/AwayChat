//
//  DeviceInfo.swift
//  Away Chat
//
//  Created by Kirti Ahlawat on 26/10/20.
//

import Foundation
import UIKit

struct DeviceInfo{
    
    static var deviceId : String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    static var devieName : String{
        return UIDevice.current.name
    }
    
    static var deviceModel : String{
        return UIDevice.current.model
    }
    
    static var systemName : String{
        return UIDevice.current.systemName
    }
    
    static var systemVersion : String{
        return UIDevice.current.systemVersion
    }
}
