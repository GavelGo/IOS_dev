//
//  SuccessViewController.swift
//  GavelGo
//
//  Created by mac on 17/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

    @IBOutlet weak var mGotoProductListBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mGotoProductListBtn.layer.cornerRadius = 5
        
    }
    
    
    @IBAction func goToProductListBtnAction(_ sender: Any) {
    }
    
}
