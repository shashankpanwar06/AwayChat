//
//  SignUpFirstVC.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 17/10/20.
//

import UIKit
import FirebaseAuth

class SignUpFirstVC: UIViewController {

    
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
    
    
    
    @IBAction func nextPressed(_ sender: DesignableButton) {
        
//        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpSecondVC") as! SignUpSecondVC
//        self.navigationController?.pushViewController(VC, animated: true)
        
        
        Auth.auth().createUser(withEmail: "iOSTest@gmail.com", password: "12345678") { (result, error) in
            print(result)
            print(error)
        }
        
    }
    
    
    
}//.
