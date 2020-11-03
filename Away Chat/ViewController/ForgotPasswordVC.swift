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
    @IBOutlet weak var emailTextField: BaseTextField!
    
    //MARK:- View Controller Life Cycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldDelegates()
    }
    
    private func setupTextFieldDelegates(){
        emailTextField.baseDelegate = self
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
        if !emailTextField.text!.isEmpty{
            ActivityIndicator.shared().show("Waiting...")
            AwayChatServices.shared.sendRequestForForgotPassword(parameters: ["email" : emailTextField.text!]) {[weak self] (status, message) in
                ActivityIndicator.shared().hide()
                if status{
                    self?.navigationController?.popViewController(animated: true)
                }else{
                    Utility.alert(title: "Alert", message: message, vc: self!, dissmissAfter: 2)
                }
            }
        }else{
            Utility.alert(title: "Alert", message: "Email field can't be empty!", vc: self, dissmissAfter: 2)
        }
    }
    
    //MARK:- Help Button Action.
    @IBAction func helpPressed(_ sender: UIButton) {
        print("Help Pressed!")
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}//.

extension ForgotPasswordVC : BaseTextFieldDelegate{
    
}
