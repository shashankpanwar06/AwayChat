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
    @IBOutlet weak var usernameTextField: BaseTextField!
    @IBOutlet weak var passwordTextField: BaseTextField!
    @IBOutlet weak var rememberMe_imageV: UIImageView!
    
    
    //MARK:- View Controller Life Cycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldDelegates()
    }
    
    private func setupTextFieldDelegates(){
        usernameTextField.baseDelegate = self
        passwordTextField.baseDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.containerView.shadowAroundView(shadowColor: LOGIN_SHADOW_COLOR)
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
        if !usernameTextField.text!.isEmpty{
            if !passwordTextField.text!.isEmpty{
                let requestParameters = ["email" : usernameTextField.text!, "password" : passwordTextField.text!]
                sendRequestForSignIn(parameters: requestParameters)
            }else{
                //Password is empty
                Utility.alert(title: "Alert", message: "Password can't be empty!", vc: self, dissmissAfter: 2)
            }
        }else{
            Utility.alert(title: "Alert", message: "Email/Username can't be empty!", vc: self, dissmissAfter: 2)
        }
    }
    
    //MARK:- Forgot Password Button Action.
    @IBAction func resetPassword(_ sender: UIButton) {
        print("Forgot Password Pressed!")
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(VC, animated: true)
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

//MARK:- API CALLS
extension LoginVC{
    
    func sendRequestForSignIn(parameters : [String : String]){
        ActivityIndicator.shared().show("Waiting...")
        AwayChatServices.shared.sendRequestForSignIn(parameters: parameters) {[weak self] (status, message) in
            ActivityIndicator.shared().hide()
            if status{
                var tabBarController = UIViewController()
                if #available(iOS 13.0, *) {
                    tabBarController = (self?.storyboard?.instantiateViewController(identifier: "TabBarController"))!
                } else {
                    // Fallback on earlier versions
                    tabBarController = (self?.storyboard?.instantiateViewController(withIdentifier: "TabBarController"))!
                }
                self?.navigationController?.pushViewController(tabBarController, animated: true)
            }else{
                Utility.alert(title: "Alert", message: message, vc: self!, dissmissAfter: 2)
            }
        }
    }
}

extension LoginVC : BaseTextFieldDelegate{
    
}
