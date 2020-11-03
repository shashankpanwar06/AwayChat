//
//  AppDelegate.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 15/10/20.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift


enum Environment : String{
    case development = "Development"
    case production = "Production"
}

var environment : Environment = .development

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        setGlobalEnvironment()
        IQKeyboardManager.shared.enable = true
        
        return true
    }

}

func setGlobalEnvironment(){
    #if DEVELOPMENT
    environment = Environment.development
    #else
    environment = Environment.production
    #endif
}



//Scene Delegates.
@available(iOS 13.0, *)
extension AppDelegate{
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
}
