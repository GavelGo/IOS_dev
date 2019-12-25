//
//  ConsumerViewController.swift
//  GavelGo
//
//  Created by mac on 24/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

enum SignUp {
    case CONSUMER
    case PARTNER
}

class ConsumerViewController: UIViewController {
    
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mUserImage: UIImageView!
    @IBOutlet weak var mFirstName: SkyFloatingLabelTextField!
    @IBOutlet weak var mLastName: SkyFloatingLabelTextField!
    @IBOutlet weak var mPhone: SkyFloatingLabelTextField!
    @IBOutlet weak var mAddress: SkyFloatingLabelTextField!
    @IBOutlet weak var mSuit: SkyFloatingLabelTextField!
    @IBOutlet weak var mCity: SkyFloatingLabelTextField!
    @IBOutlet weak var mState: SkyFloatingLabelTextField!
    @IBOutlet weak var mZipcode: SkyFloatingLabelTextField!
    @IBOutlet weak var mDescription: SkyFloatingLabelTextField!
    @IBOutlet weak var mSaveBtnView: UIView!
    @IBOutlet weak var mBtnSave: UIButton!
    @IBOutlet weak var mCancelBtnView: UIView!
    @IBOutlet weak var mBtnCancel: UIButton!
    
    var userType : SignUp!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if userType == SignUp.CONSUMER {
            mTitle.text = "Consumer Information"
        } else {
            mTitle.text = "Partner Information"
        }
        
        mSaveBtnView.themeSaveBtn()
        
        mCancelBtnView.themeSaveBtn()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                //self.view.frame.origin.y -= keyboardSize.height
                self.view.frame.origin.y -= 200
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func browseImageAction(_ sender: Any) {
    }
    
    @IBAction func saveBtnAction(_ sender: Any) {
    }
    
    @IBAction func cancelBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
