//
//  ForgotPasswordVC.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 20/10/20.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    //MARK:- Outlets/Properties.
    
    @IBOutlet weak var title_lable: UILabel!
    @IBOutlet weak var subtitle_label: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var email_field: UITextField!
    
    //MARK:- View Controller Life Cycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.containerView.shadowAroundView(shadowColor: LOGIN_SHADOW_COLOR)
    }
    
    //MARK:- Continue Button Action.
    
    @IBAction func continuePressed(_ sender: DesignableButton) {
        self.setLoginControllerRootVC()
    }
    
    //MARK:- Help Button Action.
    
    @IBAction func helpPressed(_ sender: UIButton) {
        print("Help Pressed!")
    }
    
    
    
}//.
