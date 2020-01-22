//
//  ProductListViewController.swift
//  GavelGo
//
//  Created by mac on 07/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import UIKit

protocol PProductListDelegate {
    func onProductListCallBack(products: [StructProductForSignUp])
}

class ProductListViewController: UIViewController {

    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mNextBtn: UIButton!
    
    var signUpValues: StructSignUpValues!
    var productsArray = [StructProductForSignUp]()
    
    var delegate: PProductListDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mNextBtn.layer.cornerRadius = 22.5
        
        mTableView.delegate = self
        mTableView.dataSource = self
        
        if productsArray.isEmpty {
            addProductAction(self)
        }

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate.onProductListCallBack(products: productsArray)
    }
    
    @IBAction func addProductAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "SelectCategoriesViewController") as! SelectCategoriesViewController
        //vc.signUpValues = signUpValues
        //vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
    }
    
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMyProducts") as! CellMyProducts
        
        var data = productsArray[indexPath.row]
        
        cell.mProductName.text = data.productName
        cell.mHighLights.text = data.highlights
        cell.mProductImage.image = data.images?.first
        cell.mHideBtn.isSelected = data.isActive!
        cell.btnEdit = {
            
        }
        
        cell.btnDelete = {
            
        }
        
        cell.btnActive = {
            if data.isActive! {
                data.isActive = false
            } else {
                data.isActive = true
            }
            cell.mHideBtn.isSelected = data.isActive!
        }
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ProductListViewController: PAddProductDelegate {
    
    func addNewProductCallBack(product: StructProductForSignUp) {
        self.productsArray.append(product)
        self.mTableView.reloadData()
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
    
    var btnEdit: (() -> Void)? = nil
    var btnDelete: (() -> Void)? = nil
    var btnActive: (() -> Void)? = nil
    
    override func awakeFromNib() {
        mEditView.layer.cornerRadius = 5
        mDeleteView.layer.cornerRadius = 5
        mHideBtn.tintColor = #colorLiteral(red: 0.1333333333, green: 0.5490196078, blue: 0.1333333333, alpha: 1)
    }
    
    @IBAction func editBtnAction(_ sender: Any) {
        if let action = self.btnEdit {
            action()
        }
    }
    
    @IBAction func deleteBtnAction(_ sender: Any) {
        if let action = self.btnDelete {
            action()
        }
    }
    
    @IBAction func activeBtnAction(_ sender: Any) {
        if let action = self.btnActive {
            action()
        }
    }
    
}
