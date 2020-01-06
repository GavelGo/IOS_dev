//
//  ProductListViewController.swift
//  GavelGo
//
//  Created by mac on 07/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mAddProductView: UIView!
    @IBOutlet weak var mAddProductBtn: UIButton!
    @IBOutlet weak var mSaleStatisticsView: UIView!
    @IBOutlet weak var mSaleStatisticsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

class CellMyProducts: UITableViewCell {
    @IBOutlet weak var mProductName: UILabel!
    @IBOutlet weak var mHighLights: UILabel!
    @IBOutlet weak var mProductImage: UIImageView!
    @IBOutlet weak var mEditView: UIView!
    @IBOutlet weak var mEditbtn: UIButton!
    @IBOutlet weak var mDeleteView: UIView!
    @IBOutlet weak var mDeleteBtn: UIButton!
    @IBOutlet weak var mHideBtn: UIButton!
    
}
