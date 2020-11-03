//
//  BaseTextField.swift
//  Away Chat
//
//  Created by Kirti Ahlawat on 26/10/20.
//

import UIKit

@objc protocol BaseTextFieldDelegate{
    @objc optional func textFieldShouldReturn(_ textField : UITextField) -> Bool
    @objc optional func textFieldDidEndEditing(_ textField : UITextField)
    @objc optional func textFieldShouldBeginEditing(_ textField : UITextField) -> Bool
    @objc optional func textFieldDidBeginEditing(_ textField: UITextField)
    @objc optional func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
}

class BaseTextField: UITextField {


    weak var baseDelegate: BaseTextFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        delegate = self
    }

}

extension BaseTextField : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let customDelegate = baseDelegate else {return false}
        if textField.returnKeyType != .next{
            resignFirstResponder()
        }
        if !textField.isSecureTextEntry{
            textField.text = textField.text?.trimmingCharacters(in: .whitespaces)
        }
        return customDelegate.textFieldShouldReturn?(textField) ?? true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let customDelegate = baseDelegate else {return}
        customDelegate.textFieldDidEndEditing?(textField)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let customDelegate = baseDelegate else {return true}
        return customDelegate.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let customDelegate = baseDelegate else {return}
        customDelegate.textFieldDidBeginEditing?(textField)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let customDelegate = baseDelegate else {return true}
        return customDelegate.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
}
