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
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK:- View Controller Life Cycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureBioTagCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.containerView.shadowAroundView(shadowColor: LOGIN_SHADOW_COLOR)

    }
    
    //MARK:- Helper Methods.
    
    fileprivate func configureBioTagCollectionView(){
        
        collectionView.register(UINib(nibName: "BioTagsCell", bundle: nil), forCellWithReuseIdentifier: "BioTagsCell")
        collectionView.delegate = self
        collectionView.dataSource = self
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

//MARK:- Extension for Bio Colection View Delegates/DataSources.

extension SignUpSecondVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BioTagsCell", for: indexPath) as! BioTagsCell
        
        cell.contentHolder.layer.cornerRadius = 5.0
        cell.contentHolder.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Index is:- \(indexPath.item)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 
        return CGSize(width: 100, height: collectionView.bounds.height-4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 2.0, bottom: 0.0, right: 2.0)
    }
    
    
    
}//.
