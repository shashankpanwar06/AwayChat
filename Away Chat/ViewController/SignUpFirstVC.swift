//
//  SignUpFirstVC.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 17/10/20.
//

import UIKit
import FirebaseAuth

class SignUpFirstVC: UIViewController {

    //MARK:- Properties/Outlets.
    
    @IBOutlet weak var heading_label: UILabel!
    @IBOutlet weak var subHeading_label: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var usernameTextField: BaseTextField!
    @IBOutlet weak var emailTextField: BaseTextField!
    @IBOutlet weak var passwordTextField: BaseTextField!
    @IBOutlet weak var repeatPasswordTextField: BaseTextField!
    @IBOutlet weak var usenameValidStatus: UILabel!
    
    var isUsernameVerified = false
    let usernamePlaceholer = "awaychat.com/"
    
    var requestParameters = [String : String]()
    
    //MARK:- View Controller Life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldDelegates()
    }
    
    private func setupTextFieldDelegates(){
        usernameTextField.baseDelegate = self
        emailTextField.baseDelegate = self
        passwordTextField.baseDelegate = self
        repeatPasswordTextField.baseDelegate = self
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.containerView.shadowAroundView(shadowColor: LOGIN_SHADOW_COLOR)

    }
    
    //MARK:- SignUp buttons Actions.
    
    @IBAction func signUpWithSocialAccounts(_ sender: UIButton) {
                
        switch sender.tag {
        case 2001:
            print("Sign Up With Apple")
        case 2002:
            print("Sign Up With GMail")
        case 2003:
            print("Sign Up With Facebook")
        case 2004:
            print("Sign Up With Twitter")
        default:
            break
        }
    }
    
    //MARK:- Next Button Action.
    @IBAction func nextPressed(_ sender: DesignableButton) {
        if isUsernameVerified{
            if !self.emailTextField.text!.isEmpty{
                if Utility.isValidEmail(self.emailTextField.text!){
                    self.requestParameters["email"] = self.emailTextField.text!
                    if !self.passwordTextField.text!.isEmpty{
                        if self.passwordTextField.text! == self.repeatPasswordTextField.text!{
                            self.requestParameters["password"] = self.passwordTextField.text!
                            let signupSecondVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpSecondVC") as! SignUpSecondVC
                            signupSecondVC.requestParameters = requestParameters
                            self.navigationController?.pushViewController(signupSecondVC, animated: true)
                        }else{
                            // Password and confirm password not matched
                            Utility.alert(title: "Alert", message: "Password and confirm password not matched!", vc: self, dissmissAfter: 2)
                        }
                    }else{
                        // password field is empty
                        Utility.alert(title: "Alert", message: "Password field can't be empty!", vc: self, dissmissAfter: 2)
                    }
                }else{
                    //Invalid Email Address
                    Utility.alert(title: "Alert", message: "Invalid email address!", vc: self, dissmissAfter: 2)
                }
            }else{
                // Email field is empty
                Utility.alert(title: "Alert", message: "Email field can't be empty!", vc: self, dissmissAfter: 2)
            }
        }else{
            //Username Not Valid
            Utility.alert(title: "Alert", message: "Username field can't be empty!", vc: self, dissmissAfter: 2)
        }
    }
    
    func verifyUsername(username : String){
        
        AwayChatServices.shared.sendRequestForUsernameAvailability(parameters: ["username" : username]) { [weak self](status, message) in
            guard let self = self else {return}
            if status{
                self.isUsernameVerified = true
                self.usenameValidStatus.textColor = .green
                self.requestParameters["username"] = username
            }else{
                self.isUsernameVerified = false
                self.usenameValidStatus.textColor = .red
            }
            
            self.usenameValidStatus.text = message
        }
    }
    
    //MARK:- Already Have Account Button Action.
    @IBAction func alreadyHaveAccount(_ sender: UIButton) {
        
        self.setLoginControllerRootVC()
    }
    
    //MARK:- Help Button Action.
    
    @IBAction func helpPressed(_ sender: UIButton) {
        print("Help Pressed!")
    }
    
}//.

//MARK:- Extension for Heleper methods.

extension SignUpFirstVC : BaseTextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case usernameTextField:
            print("Username End Editing")
            if let username = textField.text?.dropFirst(usernamePlaceholer.count){
                if username.isEmpty{
                    textField.text = ""
                }else{
                    verifyUsername(username: String(username))
                }
            }
        default:
            print("Default")
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case usernameTextField:
            usenameValidStatus.text = ""
            if textField.text!.isEmpty{
                textField.text?.append(usernamePlaceholer)
            }else{
                
            }
        default:
            print("default")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case usernameTextField:
            if (string.isEmpty && textField.text == usernamePlaceholer) || (range.location < usernamePlaceholer.count){
                return false
            }
            return true 
        default:
            return true
        }
        
    }
    
}
