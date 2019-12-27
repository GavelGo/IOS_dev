//
//  PartnerViewController.swift
//  GavelGo
//
//  Created by mac on 26/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class PartnerViewController: UIViewController {

    @IBOutlet weak var mUserImg: UIImageView!
    @IBOutlet weak var mFirstName: SkyFloatingLabelTextField!
    @IBOutlet weak var mLastName: SkyFloatingLabelTextField!
    @IBOutlet weak var mPhone: SkyFloatingLabelTextField!
    @IBOutlet weak var mAddress: SkyFloatingLabelTextField!
    @IBOutlet weak var mSuite: SkyFloatingLabelTextField!
    @IBOutlet weak var mCity: SkyFloatingLabelTextField!
    @IBOutlet weak var mState: SkyFloatingLabelTextField!
    @IBOutlet weak var mZipcode: SkyFloatingLabelTextField!
    @IBOutlet weak var mDescription: SkyFloatingLabelTextField!
    @IBOutlet weak var mSaveView: UIView!
    @IBOutlet weak var mAddProductView: UIView!
    @IBOutlet weak var mSaveActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mSaveView.themeSaveBtn()
        mAddProductView.themeSaveBtn()
        mUserImg.makeRounded()
        
        mFirstName.delegate = self
        mLastName.delegate = self
        mPhone.delegate = self
        mAddress.delegate = self
        mSuite.delegate = self
        mCity.delegate = self
        mState.delegate = self
        mZipcode.delegate = self
        mDescription.delegate = self
        
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
    
    @IBAction func browseUserImgAction(_ sender: Any) {
        
        JCUIImagePickerManager.sharedInstance.pickImageFrom(allowsEditing: true, sourceType: .photoLibrary, target: self) { (info, error) in
            print("Image Callback.....")
            if error == nil {
                let img = info?[.editedImage] as? UIImage;
                print("Image Selected : \(img?.description)")
                self.mUserImg.image = img
            } else {
                print("Error : \(error)")
            }
        }
        
    }
    
    @IBAction func saveAccountAction(_ sender: Any) {
    }
    
    @IBAction func addProductAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "AddProductViewController") as! AddProductViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension PartnerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
