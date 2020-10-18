//
//  LoginVC.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 17/10/20.
//

import UIKit

class LoginVC: UIViewController {

    
    //MARK:- Properties/Outlets.
    
    @IBOutlet weak var heading_label: UILabel!
    @IBOutlet weak var subHeading_label: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var username_field: UITextField!
    @IBOutlet weak var password_field: UITextField!
    @IBOutlet weak var rememberMe_imageV: UIImageView!
    
    
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
    
    
    
    //MARK:- Social Login Button's Actions.
    
    @IBAction func socialLogins(_ sender: UIButton) {
        
        switch sender.tag {
        case 1001:
            print("Apple Sign In")
        case 1002:
            print("Gmail Sign In")
        case 1003:
            print("Facebook Sign In")
        case 1004:
            print("Twitter Sign In")
        default:
            break
        }
        
    }
    
    //MARK:- Remembered Me Button Action.
    
    @IBAction func rememberMe(_ sender: UIButton) {
        print("Remember me Pressed!")
    }
    
    //MARK:- Login Button Action.
    
    @IBAction func LoginUser(_ sender: DesignableButton) {
        print("Login User Pressed!")
    }
    
    //MARK:- Forgot Password Button Action.
    
    @IBAction func resetPassword(_ sender: UIButton) {
        print("Forgot Password Pressed!")
    }
    
    //MARK:- Don't have account button action.
    
    @IBAction func signUp(_ sender: UIButton) {
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpFirstVC") as! SignUpFirstVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    //MARK:- Help Button Action.
    
    @IBAction func helpPressed(_ sender: UIButton) {
        print("Help Pressed!")
    }
    
    
}//.
