//
//  SignUpSecondVC.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 18/10/20.
//

import UIKit

class SignUpSecondVC: UIViewController {

    //MARK:- Properties/Outlets
    
    @IBOutlet weak var heading_label: UILabel!
    @IBOutlet weak var subHeading_label: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var firstName_field: UITextField!
    @IBOutlet weak var lastName_field: UITextField!
    
    //MARK:- View Controller Life Cycle.
    
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
    
    //MARK:- Register Button Pressed.
    
    @IBAction func registerPressed(_ sender: DesignableButton) {
        print("Register Pressed!")
    }
    
    //MARK:- Already Have An Accont Button Action.
    
    @IBAction func alreadyHaveAccount(_ sender: UIButton) {
        self.setLoginControllerRootVC()
    }
    
    //MARK:- Help Button Action.
    
    @IBAction func helpPressed(_ sender: UIButton) {
        print("Help Pressed!")
    }
    
    
    
}//.

//MARK:- Extension for helper methods.

extension SignUpSecondVC{
    
    
    
}//.
