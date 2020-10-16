//
//  DesignableButton.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 16/10/20.
//

import Foundation
import UIKit


//MARK:- UIButton.

@IBDesignable
class DesignableButton: UIButton {
    
    
    @IBInspectable
    var bgColor:UIColor = UIColor.clear{
        
        didSet{
            self.backgroundColor = bgColor
        }
    }
    
    @IBInspectable
    var cornerRadius:CGFloat = 0.0{
        
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var borderColor:UIColor = UIColor.clear{
        
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
        
    }
    
    @IBInspectable
    var borderWidth:CGFloat = 0.0{
        
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    
}//.
