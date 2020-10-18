//
//  LoginVC.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 17/10/20.
//

import UIKit

class LoginVC: UIViewController {

    
    
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
 
        
        self.containerView.shadowAroundView(shadowColor: UIColor(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0, alpha: 1.0))
    }
    
    

}//.
