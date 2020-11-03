//
//  DesignableView.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 22/10/20.
//

import Foundation
import UIKit


class DesignableView: UIView {
    
    
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
    
    
}//..
