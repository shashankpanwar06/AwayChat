//
//  UIViewController+Extension.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 18/10/20.
//

import Foundation
import UIKit


extension UIViewController{
    
    //MARK:- Set Login Controller as root view controller.
    
    func setLoginControllerRootVC(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        let navigationController = UINavigationController(rootViewController: nextViewController)
        navigationController.isNavigationBarHidden = true
        
        if #available(iOS 13.0, *) {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene{
                if let sceneDelegate = scene.delegate as? SceneDelegate{
                    sceneDelegate.window?.rootViewController = navigationController
                    sceneDelegate.window?.makeKeyAndVisible()
                }
            }
        } else {
            // Fallback on earlier versions
            
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
                
                appDelegate.window?.rootViewController = navigationController
                appDelegate.window?.makeKeyAndVisible()
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
}//.
