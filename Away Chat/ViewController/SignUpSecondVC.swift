//
//  SignUpSecondVC.swift
//  Away Chat
//
//  Created by Sukhwinder singh Warring on 18/10/20.
//

import UIKit
import Foundation
import DropDown

class SignUpSecondVC: UIViewController {

    //MARK:- Properties/Outlets
    
    @IBOutlet weak var heading_label: UILabel!
    @IBOutlet weak var subHeading_label: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var firstNameTextField: BaseTextField!
    @IBOutlet weak var lastNameTextField: BaseTextField!
    @IBOutlet weak var bio_View: DesignableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var bioTagDropDown = DropDown()
    private var selectedBioTags = [String]()
    
    var requestParameters = [String : Any]()
    var profileCategories = [ProfileCategory]()
    
    //MARK:- View Controller Life Cycle.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureBioTagCollectionView()
        sendRequestForGetProfileCategories()
        setupTextFieldDelegates()
    }
    
    private func setupTextFieldDelegates(){
        firstNameTextField.baseDelegate = self
        lastNameTextField.baseDelegate = self
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
        if !firstNameTextField.text!.isEmpty{
            requestParameters["firstName"] = firstNameTextField.text
            if !lastNameTextField.text!.isEmpty{
                requestParameters["lastName"] = lastNameTextField.text
                if selectedBioTags.count != 0{
                    requestParameters["bio"] = selectedBioTags
                    sendRequestForSignUp(parameters: requestParameters)
                }else{
                    //Profile Category not selected
                    Utility.alert(title: "Alert", message: "No profile category selected!", vc: self, dissmissAfter: 2)
                }
            }else{
                //Last Name field is empty
                Utility.alert(title: "Alert", message: "Last Name can't be empty!", vc: self, dissmissAfter: 2)
            }
        }else{
            // First Name field is empty
            Utility.alert(title: "Alert", message: "First Name can't be empty!", vc: self, dissmissAfter: 2)
        }
    }
    
    //MARK:- Already Have An Accont Button Action.
    
    @IBAction func alreadyHaveAccount(_ sender: UIButton) {
        self.setLoginControllerRootVC()
    }
    
    //MARK:- Help Button Action.
    
    @IBAction func helpPressed(_ sender: UIButton) {
        print("Help Pressed!")
    }
    
    //MARK:-  Show/Hide Bio Drop Down.
    
    @IBAction func showBioDropDown(_ sender: UIButton) {
        bioTagDropDown(isShown: true)
    }
    
    
}//.


//MARK:- API CALLS
extension SignUpSecondVC{
    
    func sendRequestForSignUp(parameters : [String : Any]){
        ActivityIndicator.shared().show("Waiting...")
        AwayChatServices.shared.sendRequestForSignUp(parameters: parameters) { [weak self] (status, message) in
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
                //Display Error message by server
                Utility.alert(title: "Alert", message: message, vc: self!, dissmissAfter: 2)
            }
        }
    }
    
    func sendRequestForGetProfileCategories(){
        ActivityIndicator.shared().show("Loading Profile Categories...")
        AwayChatServices.shared.sendRequestForGetBioList { [weak self] (profileCategories) in
            ActivityIndicator.shared().hide()
            self?.profileCategories = profileCategories
            self?.configureDropDown()
        }
    }
}

//MARK:- Extension for Bio Colection View Delegates/DataSources.
extension SignUpSecondVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedBioTags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BioTagsCell", for: indexPath) as! BioTagsCell
        
        cell.contentHolder.layer.cornerRadius = 5.0
        cell.contentHolder.clipsToBounds = true
        
        cell.tag_title.text = selectedBioTags[indexPath.item]
        cell.cancel_btn.tag = indexPath.item
        cell.cancel_btn.addTarget(self, action: #selector(removeBioTag(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Index is:- \(indexPath.item)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 
        let font = UIFont(name: "billcorporatenarrowW00-medium", size: 12.0)
        let width = selectedBioTags[indexPath.item].widthOfString(usingFont: font!)
        return  CGSize(width: width+50.0, height: collectionView.bounds.height-4) //CGSize(width: 100, height: collectionView.bounds.height-4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 2.0, bottom: 0.0, right: 2.0)
    }
    
    @objc func removeBioTag(_ sender:UIButton){
        
        selectedBioTags.remove(at: sender.tag)
        collectionView.reloadData()
    }
    
    fileprivate func scrollToLast(){
        collectionView.scrollToItem(at: IndexPath(item: selectedBioTags.count-1, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}//.

//MARK:- Bio Tags Drop Down Fuctionality.

extension SignUpSecondVC{
    
    
    //MARK:- Configure Drop Down.
    
    fileprivate func configureDropDown(){
        
        bioTagDropDown.anchorView = bio_View
        bioTagDropDown.dataSource = self.profileCategories.map({$0.name!})
        bioTagDropDown.direction = .bottom
        bioTagDropDown.dismissMode = .onTap
        bioTagDropDown.bottomOffset = CGPoint(x: 0, y:(bioTagDropDown.anchorView?.plainView.bounds.height)!)

        registerSelectionTap()

    }
    
    fileprivate func registerSelectionTap(){
        bioTagDropDown.selectionAction = { (index: Int, item: String) in
          
            if self.selectedBioTags.contains(item) == false{
                self.selectedBioTags.append(item)
                self.collectionView.reloadData()
                self.scrollToLast()
            }
        }
    }
    
    fileprivate func bioTagDropDown(isShown:Bool){
        
        if isShown{
            bioTagDropDown.show()
        }else{
            bioTagDropDown.hide()
        }
        
    }
    
    
}//.

//MARK: Text Field Delegate Methods
extension SignUpSecondVC : BaseTextFieldDelegate{
    
     
}
