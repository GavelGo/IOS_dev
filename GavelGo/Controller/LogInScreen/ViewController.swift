//
//  ViewController.swift
//  GavelGo
//
//  Created by mac on 22/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Toaster

class ViewController: UIViewController {

    @IBOutlet weak var mEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var mPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var mSignInBtnView: UIView!
    @IBOutlet weak var mSignInIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mSignInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mEmail.placeholder = "Email"
        mEmail.keyboardType = .emailAddress
        mEmail.autocorrectionType = .no
        
        mPassword.placeholder = "Password"
        mPassword.autocorrectionType = .no
        mPassword.isSecureTextEntry = true
        
        mEmail.delegate = self
        mPassword.delegate = self
        
        mSignInIndicator.isHidden = true
        mSignInBtnView.themeSaveBtn()
        
    }

    @IBAction func forgotPassAction(_ sender: Any) {
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        let userName = mEmail.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let password = mPassword.text?.trimmingCharacters(in: .whitespaces) ?? ""
        
        if userName.isEmpty {
            mEmail.errorMessage = "Please Enter UserName"
            return
        } else {
            mEmail.errorMessage = ""
        }
        if password.isEmpty {
            mPassword.errorMessage = "Please Enter Password"
            return
        } else {
            mPassword.errorMessage = ""
        }
        
        authentication(userName: userName, password: password)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func authentication(userName: String, password: String) {
        
        mSignInBtn.isHidden = true
        mSignInIndicator.isHidden = false
        mSignInIndicator.startAnimating()
        
        let header = NSMutableDictionary.init(dictionary: ["Content-Type" : "application/json"])
        
        let params = NSMutableDictionary.init()
        params.addEntries(from: ["username" : userName,
                                 "password" : password])
        
        WebService.sharedObject().callWebservice(urlString: APIs.LOGIN, method: .post, dicHeader: header, dicParameters: params, allowHud: false) { (response, error) in
            
            self.mSignInIndicator.stopAnimating()
            self.mSignInIndicator.isHidden = true
            self.mSignInBtn.isHidden = false
            
            guard let data = response else { return }
               do {
                
                let decoder = JSONDecoder()
                
                //let jsonString = "{\"error\": \"Bad Request\", \"message\": \"Message\", \"path\": \"/authenticate\", \"status\": 400, \"timestamp\": \"2019-12-25T18:27:51.453+0000\"}"
                let dictionary = data as! NSDictionary
                
                let jsonData: NSData = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
                if error == nil {
                    
                    let resData = try decoder.decode(APIResponseStruct.self, from: jsonData as Data)
                    print(resData.status)
                    
                    if resData.status == 200 {
                        self.changeRootViewController()
                    } else {
                        ToastView.appearance().backgroundColor = #colorLiteral(red: 0.6509803922, green: 0.7647058824, blue: 0.6509803922, alpha: 1)
                        Toast(text: "Error Code : \(resData.status)").show()
                    }
                    
                }
                
               } catch let err {
                print("Err", err)
            }
            
        }
        
    }
    
    func changeRootViewController() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
                
        //        guard let rootViewController = window.rootViewController else {
        //            return
        //        }

        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "HomeNavigationController") as! HomeNavigationController
        UIView.transition(with: window, duration: 0.7, options: .transitionCrossDissolve, animations: {
            window.rootViewController = navigationController
        }) { (completed) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
