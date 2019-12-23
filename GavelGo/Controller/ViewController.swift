//
//  ViewController.swift
//  GavelGo
//
//  Created by mac on 22/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ViewController: UIViewController {

    @IBOutlet weak var mEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var mPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var mSignInBtnView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mEmail.placeholder = "Email"
        mEmail.keyboardType = .emailAddress
        mEmail.autocorrectionType = .no
        
        mPassword.placeholder = "Password"
        mPassword.autocorrectionType = .no
        mPassword.isSecureTextEntry = true
        
        mSignInBtnView.layer.cornerRadius = 10
        mSignInBtnView.layer.borderWidth = 1
        mSignInBtnView.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 0.8571473394, alpha: 1)
        
    }

    @IBAction func forgotPassAction(_ sender: Any) {
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        guard let rootViewController = window.rootViewController else {
            return
        }
        
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "HomeTabBarViewController") as! HomeTabBarViewController
        UIView.transition(with: window, duration: 0.7, options: .transitionCrossDissolve, animations: {
            window.rootViewController = navigationController
        }) { (completed) in
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func signUpAction(_ sender: Any) {
    }
    
}

