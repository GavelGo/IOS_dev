//
//  SelectCategoryViewController.swift
//  GavelGo
//
//  Created by mac on 17/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SelectCategoriesViewController: UIViewController {

    @IBOutlet weak var mNextBtn: UIButton!
    @IBOutlet weak var mCategory: SkyFloatingLabelTextField!
    @IBOutlet weak var mSubCategories: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mNextBtn.layer.cornerRadius = 22.5
    }

    @IBAction func nextBtnAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "KeywordsViewController") as! KeywordsViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
