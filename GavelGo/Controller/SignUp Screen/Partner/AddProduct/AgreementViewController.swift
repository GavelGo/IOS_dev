//
//  AgreementViewController.swift
//  GavelGo
//
//  Created by mac on 17/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import UIKit

class AgreementViewController: UIViewController {

    @IBOutlet weak var mDoneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mDoneBtn.layer.cornerRadius = 22.5
        
    }
    
    @IBAction func doneBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SuccessViewController") as! SuccessViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
