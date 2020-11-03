//
//  BundleExt.swift
//  Away Chat
//
//  Created by Kirti Ahlawat on 26/10/20.
//

import Foundation

extension Bundle{
    /*
     Description : Gives the Version Number of the App
     */
    class var releasedVersionNumber : String{
        return self.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    /*
     Description : Gives the build number of the App
     */
    class var buildVersionNumber : String{
        return self.main.infoDictionary!["CFBundleVersion"] as! String
    }
}
