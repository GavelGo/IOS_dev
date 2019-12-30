//
//  HomeSearchViewController.swift
//  GavelGo
//
//  Created by mac on 31/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import PolioPager

class HomeSearchViewController: UIViewController, PolioPagerSearchTabDelegate, UITextFieldDelegate {
    
    var searchBar: UIView!
    var searchTextField: UITextField!
    var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchTextField?.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else{ return true }
        return true
    }
    
}
