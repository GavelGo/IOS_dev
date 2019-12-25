//
//  ForgotPasswordViewController.swift
//  GavelGo
//
//  Created by mac on 25/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var mUserName: SkyFloatingLabelTextField!
    @IBOutlet weak var mPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var mConfirmPassword: SkyFloatingLabelTextField!
    @IBOutlet weak var mChangePassView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        mChangePassView.themeSaveBtn()
        
    }
    
    @IBAction func changePasswordAction(_ sender: Any) {
    }
    
}
