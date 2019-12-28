//
//  SignUpViewController.swift
//  GavelGo
//
//  Created by mac on 23/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Toast_Swift

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var mUserName: SkyFloatingLabelTextField!
    @IBOutlet weak var mEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var mPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var mConfirmPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var mUserTypetf: UITextField!
    @IBOutlet weak var mSignUpView: UIView!
    @IBOutlet weak var mSignInActivityIndicator: UIActivityIndicatorView!
    
    let mListOfUserTypes = ["Consumer", "Partner"]
    var picker: UIPickerView!
    var currentPickerViewSelectedRow : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mUserName.placeholder = "Username"
        mUserName.keyboardType = .default
        mUserName.autocorrectionType = .no
        //mUserName.placeholderFont = UIFont.init(name: mUserName.font!.fontName, size: 13)
        
        mEmail.placeholder = "Email"
        mEmail.keyboardType = .emailAddress
        mEmail.autocorrectionType = .no
        //mEmail.placeholderFont = UIFont.init(name: mEmail.font!.fontName, size: 13)
        
        mPassword.placeholder = "Password"
        mPassword.autocorrectionType = .no
        mPassword.isSecureTextEntry = true
        //mPassword.placeholderFont = UIFont.init(name: mPassword.font!.fontName, size: 13)
        
        mConfirmPassword.placeholder = "Confirm Password"
        mConfirmPassword.autocorrectionType = .no
        mConfirmPassword.isSecureTextEntry = true
        //mConfirmPassword.placeholderFont = UIFont.init(name: mConfirmPassword.font!.fontName, size: 10)
        
        mUserName.delegate = self
        mEmail.delegate = self
        mPassword.delegate = self
        mConfirmPassword.delegate = self
        
        mSignUpView.themeSaveBtn()
        
        mSignInActivityIndicator.isHidden = true
        
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

        picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        picker.backgroundColor = .white
        
        picker.delegate = self
        picker.dataSource = self
        
        mUserTypetf.inputView = picker
        mUserTypetf.inputAccessoryView = toolBar
        
    }
    
    @objc func pickerDoneButtonAction(){
        if currentPickerViewSelectedRow == nil {
            self.mUserTypetf.text = mListOfUserTypes[0]
            self.currentPickerViewSelectedRow = 0
        }
        mUserTypetf.resignFirstResponder()
    }
    
    @objc func pickercancelClick(){
        mUserTypetf.resignFirstResponder()
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "PartnerViewController") as! PartnerViewController
        navigationController?.pushViewController(vc, animated: true)
        
        let userName = mUserName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = mEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = mPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let confirmPassword = mConfirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        if userName!.isEmpty {
            mUserName.errorMessage = "Please Enter Username"
            return
        } else if email!.isEmpty {
            mEmail.errorMessage = "Please Enter Email"
            return
        } else if password!.isEmpty {
            mPassword.errorMessage = "Please Enter Password"
            return
        } else if confirmPassword!.isEmpty {
            mConfirmPassword.errorMessage = "Please Enter Confirm Password"
            return
        } else {
            
            if !email!.isValidEmail() {
                mEmail.errorMessage = "Please Enter Valid Email"
                return
            }
            if password != confirmPassword {
                mConfirmPassword.errorMessage = "Please Enter Valid Confirm Password"
                return
            }
            
            mUserName.errorMessage = ""
            mEmail.errorMessage = ""
            mPassword.errorMessage = ""
            mConfirmPassword.errorMessage = ""
            
        }

        let userType = mUserTypetf.text
        if userType == "Consumer" {
            registerConsumerUser(userName: userName!, email: email!, password: password!)
        } else if userType == "Partner" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "PartnerViewController") as! PartnerViewController
            navigationController?.pushViewController(vc, animated: true)
        } else {
            print("UserType Empty...")
            self.navigationController?.view.makeToast("Please Select User Type")
        }
        
    }
    
    @IBAction func loginAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func registerConsumerUser(userName: String, email: String, password: String) {
        
        self.mSignInActivityIndicator.isHidden = false
        self.mSignInActivityIndicator.startAnimating()
        
        let params = ["username" : userName,
                      "email" : email,
                      "password" : password]
        
        WebService.sharedObject().callWebservice(urlString: APIs.POST_REGISTER_NEW_USER, method: .post, dicParameters: params, allowHud: false) { (response, error) in
            self.mSignInActivityIndicator.stopAnimating()
            self.mSignInActivityIndicator.isHidden = true
            
//            let vc = storyboard?.instantiateViewController(withIdentifier: "ConsumerViewController") as! ConsumerViewController
//            navigationController?.pushViewController(vc, animated: true)
            
        }
        
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
        self.mUserTypetf.text = mListOfUserTypes[row]
        self.currentPickerViewSelectedRow = row
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
