//
//  KeywordsViewController.swift
//  GavelGo
//
//  Created by mac on 17/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import TagListView

class KeywordsViewController: UIViewController {

    @IBOutlet weak var mNextBtn: UIButton!
    @IBOutlet weak var mKeywordTf: SkyFloatingLabelTextField!
    @IBOutlet weak var mTagList: TagListView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mNextBtn.layer.cornerRadius = 22.5
        
    }
    @IBAction func nextBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddPhotosViewController") as! AddPhotosViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
