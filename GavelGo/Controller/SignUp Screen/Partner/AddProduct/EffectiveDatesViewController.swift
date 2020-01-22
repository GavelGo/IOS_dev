//
//  EffectiveDatesViewController.swift
//  GavelGo
//
//  Created by mac on 17/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import UIKit

class EffectiveDatesViewController: UIViewController {

    @IBOutlet weak var mNextBtnAction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mNextBtnAction.layer.cornerRadius = 22.5
        
    }
    @IBAction func nextbtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AgreementViewController") as! AgreementViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
