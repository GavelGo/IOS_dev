//
//  SetupDealViewController.swift
//  GavelGo
//
//  Created by mac on 17/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import UIKit

class SetupDealViewController: UIViewController {

    @IBOutlet weak var mNextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mNextBtn.layer.cornerRadius = 22.5
        
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddressesViewController") as! AddressesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
