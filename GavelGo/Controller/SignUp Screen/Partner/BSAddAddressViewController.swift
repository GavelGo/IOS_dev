//
//  BSAddAddressViewController.swift
//  GavelGo
//
//  Created by mac on 08/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

protocol PBSAddAddressDelegate {
    func onBsAddAddressCallBack(data: StructAddresses)
}

class BSAddAddressViewController: UIViewController {
    
    @IBOutlet weak var mShopName: SkyFloatingLabelTextField!
    @IBOutlet weak var mPhoneNumber: SkyFloatingLabelTextField!
    @IBOutlet weak var mSuite: SkyFloatingLabelTextField!
    @IBOutlet weak var mAddress: SkyFloatingLabelTextField!
    @IBOutlet weak var mCity: SkyFloatingLabelTextField!
    @IBOutlet weak var mState: SkyFloatingLabelTextField!
    @IBOutlet weak var mZipCode: SkyFloatingLabelTextField!
    @IBOutlet weak var mAddProductView: UIView!
    @IBOutlet weak var mAddProductBtn: UIButton!
    
    var delegate: PBSAddAddressDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addProductAction(_ sender: Any) {
        
        let shopName = mShopName.text?.trimmingCharacters(in: .whitespaces)
        let phoneNumber = mPhoneNumber.text?.trimmingCharacters(in: .whitespaces)
        let suite = mSuite.text?.trimmingCharacters(in: .whitespaces)
        let address = mAddress.text?.trimmingCharacters(in: .whitespaces)
        let city = mCity.text?.trimmingCharacters(in: .whitespaces)
        let state = mState.text?.trimmingCharacters(in: .whitespaces)
        let zipCode = mZipCode.text?.trimmingCharacters(in: .whitespaces)
        
        delegate.onBsAddAddressCallBack(data: StructAddresses(shopName: shopName, phoneNumber: phoneNumber, suite: suite, address: address, city: city, state: state, zipCode: zipCode))
        dismiss(animated: true, completion: nil)
    }
    
}
