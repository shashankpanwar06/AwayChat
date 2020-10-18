//
//  UIView+Extension.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 17/10/20.
//

import Foundation
import UIKit



extension UIView{
    
    
    
    func shadowAroundView(shadowColor:UIColor){
        
        let shadowSize : CGFloat = 20.0
            let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                       y: -shadowSize / 2,
                                                       width: self.frame.size.width + shadowSize,
                                                       height: self.frame.size.height + shadowSize))
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 5.0
            self.layer.shadowOpacity = 0.7
            self.layer.shadowPath = shadowPath.cgPath
    }
    
    
    
    
}//.
