//
//  AddressesViewController.swift
//  GavelGo
//
//  Created by mac on 08/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import UIKit
import FittedSheets

protocol PAddressesDelegate {
    func onAddressesCallBack(data: [StructAddresses])
}

class AddressesViewController: UIViewController {
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mNextBtn: UIButton!
    
    var addressArray = [StructAddresses]()
    var delegate: PAddressesDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        mTableView.delegate = self
        mTableView.dataSource = self
        mNextBtn.layer.cornerRadius = 22.5
        if addressArray.isEmpty {
            addAddressAction(self)
        }
        
    }
    
    @IBAction func addAddressAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "BSAddAddressViewController") as! BSAddAddressViewController
        vc.delegate = self
        let sheetController = SheetViewController(controller: vc)
        sheetController.blurBottomSafeArea = true
        sheetController.adjustForBottomSafeArea = true
        sheetController.topCornersRadius = 10
        sheetController.dismissOnBackgroundTap = true
        self.present(sheetController, animated: true, completion: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.onAddressesCallBack(data: addressArray)
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EffectiveDatesViewController") as! EffectiveDatesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension AddressesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellAddresses") as! CellAddresses
        
        let data = addressArray[indexPath.row]
        
        cell.mName.text = data.shopName
        cell.mSuiteAddress.text = "" + data.suite! + ", " + data.address!
        cell.mCityState.text = "" + data.city! + ", " + data.state! + " - " + data.zipCode!
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension AddressesViewController: PBSAddAddressDelegate {
    
    func onBsAddAddressCallBack(data: StructAddresses) {
        self.addressArray.append(data)
        self.mTableView.reloadData()
    }
    
}

class CellAddresses: UITableViewCell {
    @IBOutlet weak var mName: UILabel!
    @IBOutlet weak var mSuiteAddress: UILabel!
    @IBOutlet weak var mCityState: UILabel!
}
