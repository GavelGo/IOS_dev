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
    @IBOutlet weak var mSaveBtn: UIButton!
    @IBOutlet weak var mAddProductView: UIView!
    @IBOutlet weak var mSaveActivityIndicator: UIActivityIndicatorView!
    
    var signUpValues: StructSignUpValues!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = .white
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
        
        mSaveBtn.isHidden = false
        mSaveActivityIndicator.isHidden = true
        
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
        
        let fName = mFirstName.text?.trimmingCharacters(in: .whitespaces)
        let lName = mLastName.text?.trimmingCharacters(in: .whitespaces)
        let phone = mPhone.text?.trimmingCharacters(in: .whitespaces)
        let address = mAddress.text?.trimmingCharacters(in: .whitespaces)
        let suite = mSuite.text?.trimmingCharacters(in: .whitespaces)
        let city = mCity.text?.trimmingCharacters(in: .whitespaces)
        let state = mState.text?.trimmingCharacters(in: .whitespaces)
        let zipcode = mZipcode.text?.trimmingCharacters(in: .whitespaces)
        let description = mDescription.text?.trimmingCharacters(in: .whitespaces)
        
        if fName!.isEmpty {
            removeAllValidationErrors()
            mFirstName.errorMessage = "Please Enter First Name"
            return
        } else if lName!.isEmpty {
            removeAllValidationErrors()
            mLastName.errorMessage = "Please Enter Last Name"
            return
        } else if phone!.isEmpty {
           removeAllValidationErrors()
            mPhone.errorMessage = "Please Enter Phone Number"
            return
        } else if address!.isEmpty {
            removeAllValidationErrors()
            mAddress.errorMessage = "Please Enter Address"
            return
        } else if suite!.isEmpty {
            removeAllValidationErrors()
            mSuite.errorMessage = "Please Enter Suite"
            return
        } else if city!.isEmpty {
            removeAllValidationErrors()
            mCity.errorMessage = "Please Enter City"
            return
        } else if state!.isEmpty {
            removeAllValidationErrors()
            mState.errorMessage = "Please Enter State"
            return
        } else if zipcode!.isEmpty {
            removeAllValidationErrors()
            mZipcode.errorMessage = "Please Enter Zipcode"
            return
        } else if description!.isEmpty {
            removeAllValidationErrors()
            mDescription.errorMessage = "Please Enter Description"
            return
        } else {
            removeAllValidationErrors()
        }
        
        signUpValues.fName = fName!
        signUpValues.lName = lName!
        signUpValues.phone = phone!
        signUpValues.address = address!
        signUpValues.suite = suite!
        signUpValues.city = city!
        signUpValues.state = state!
        signUpValues.zipcode = zipcode!
        signUpValues.description = description!
        
        mSaveBtn.isHidden = false
        mSaveActivityIndicator.isHidden = true
        
    }
    
    func removeAllValidationErrors() {
        mFirstName.errorMessage = ""
        mLastName.errorMessage = ""
        mPhone.errorMessage = ""
        mAddress.errorMessage = ""
        mSuite.errorMessage = ""
        mCity.errorMessage = ""
        mState.errorMessage = ""
        mZipcode.errorMessage = ""
        mDescription.errorMessage = ""
    }
    
    @IBAction func addProductAction(_ sender: Any) {
        
//        let fName = mFirstName.text?.trimmingCharacters(in: .whitespaces)
//        let lName = mLastName.text?.trimmingCharacters(in: .whitespaces)
//        let phone = mPhone.text?.trimmingCharacters(in: .whitespaces)
//        let address = mAddress.text?.trimmingCharacters(in: .whitespaces)
//        let suite = mSuite.text?.trimmingCharacters(in: .whitespaces)
//        let city = mCity.text?.trimmingCharacters(in: .whitespaces)
//        let state = mState.text?.trimmingCharacters(in: .whitespaces)
//        let zipcode = mZipcode.text?.trimmingCharacters(in: .whitespaces)
//        let description = mDescription.text?.trimmingCharacters(in: .whitespaces)
//
//        if fName!.isEmpty {
//            removeAllValidationErrors()
//            mFirstName.errorMessage = "Please Enter First Name"
//            return
//        } else if lName!.isEmpty {
//            removeAllValidationErrors()
//            mLastName.errorMessage = "Please Enter Last Name"
//            return
//        } else if phone!.isEmpty {
//           removeAllValidationErrors()
//            mPhone.errorMessage = "Please Enter Phone Number"
//            return
//        } else if address!.isEmpty {
//            removeAllValidationErrors()
//            mAddress.errorMessage = "Please Enter Address"
//            return
//        } else if suite!.isEmpty {
//            removeAllValidationErrors()
//            mSuite.errorMessage = "Please Enter Suite"
//            return
//        } else if city!.isEmpty {
//            removeAllValidationErrors()
//            mCity.errorMessage = "Please Enter City"
//            return
//        } else if state!.isEmpty {
//            removeAllValidationErrors()
//            mState.errorMessage = "Please Enter State"
//            return
//        } else if zipcode!.isEmpty {
//            removeAllValidationErrors()
//            mZipcode.errorMessage = "Please Enter Zipcode"
//            return
//        } else if description!.isEmpty {
//            removeAllValidationErrors()
//            mDescription.errorMessage = "Please Enter Description"
//            return
//        } else {
//            removeAllValidationErrors()
//        }
//
//        signUpValues.fName = fName!
//        signUpValues.lName = lName!
//        signUpValues.phone = phone!
//        signUpValues.address = address!
//        signUpValues.suite = suite!
//        signUpValues.city = city!
//        signUpValues.state = state!
//        signUpValues.zipcode = zipcode!
//        signUpValues.description = description!
        
        let vc = storyboard?.instantiateViewController(identifier: "AddProductViewController") as! AddProductViewController
        vc.signUpValues = signUpValues
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension PartnerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
