//
//  ViewController.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 15/10/20.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var appName_label: UILabel!
    @IBOutlet weak var Heading_label: UILabel!
    @IBOutlet weak var subHeading_label: UILabel!
    @IBOutlet weak var signUpNow_button: UIButton!
    @IBOutlet weak var login_button: UIButton!
    
    @IBAction func signUp(_ sender: DesignableButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpFirstVC") as! SignUpFirstVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func login(_ sender: DesignableButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}//..
