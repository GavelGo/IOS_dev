//
//  SignUpViewController.swift
//  GavelGo
//
//  Created by mac on 23/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var mUserName: SkyFloatingLabelTextField!
    @IBOutlet weak var mEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var mPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var mConfirmPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var mUserTypetf: UITextField!
    @IBOutlet weak var mSignUpView: UIView!
    
    let mListOfUserTypes = ["Consumer", "Partner"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mUserName.placeholder = "Username"
        mUserName.keyboardType = .default
        mUserName.autocorrectionType = .no
        
        mEmail.placeholder = "Email"
        mEmail.keyboardType = .emailAddress
        mEmail.autocorrectionType = .no
        
        mPassword.placeholder = "Password"
        mPassword.autocorrectionType = .no
        mPassword.isSecureTextEntry = true
        
        mConfirmPassword.placeholder = "Confirm Password"
        mConfirmPassword.autocorrectionType = .no
        mConfirmPassword.isSecureTextEntry = true
        
        mSignUpView.themeSaveBtn()
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.pickerDoneButtonAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.pickercancelClick))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        let picker: UIPickerView
        picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        picker.backgroundColor = .white
        
        picker.delegate = self
        picker.dataSource = self
        
        mUserTypetf.inputView = picker
        mUserTypetf.inputAccessoryView = toolBar
        
    }
    
    @objc func pickerDoneButtonAction(){
        mUserTypetf.resignFirstResponder()
    }
    
    @objc func pickercancelClick(){
        mUserTypetf.resignFirstResponder()
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ConsumerViewController") as! ConsumerViewController
        vc.userType = .CONSUMER
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func loginAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func registerConsumerUser() {
        
        
        
    }
    
}

extension SignUpViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mListOfUserTypes[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mListOfUserTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mUserTypetf.text = mListOfUserTypes[row]
    }
    
}
