//
//  AddProductViewController.swift
//  GavelGo
//
//  Created by mac on 27/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class AddProductViewController: UIViewController {

    @IBOutlet weak var mProductName: SkyFloatingLabelTextField!
    @IBOutlet weak var mSelectCategoryTf: UITextField!
    @IBOutlet weak var mSelectSubCategoryTf: UITextField!
    @IBOutlet weak var mProductImage: UIImageView!
    @IBOutlet weak var mPriceTf: UITextField!
    @IBOutlet weak var mUnitBtn: UIButton!
    @IBOutlet weak var mSelectKeywords: SkyFloatingLabelTextField!
    @IBOutlet weak var mProductDescription: UITextView!
    @IBOutlet weak var mSaveBtnView: UIView!
    @IBOutlet weak var mCancelBtnView: UIView!
    @IBOutlet weak var mSaveBtn: UIButton!
    
    var categoryPicker: UIPickerView!
    var subCategoryPicker: UIPickerView!
    
    var mCategories = [StructCategories]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mSaveBtnView.themeSaveBtn()
        mCancelBtnView.themeSaveBtn()
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.pickerDoneButtonAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.pickercancelClick))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        categoryPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        categoryPicker.backgroundColor = .white
        categoryPicker.tag = 1
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        subCategoryPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        subCategoryPicker.backgroundColor = .white
        subCategoryPicker.tag = 2
        
        subCategoryPicker.delegate = self
        subCategoryPicker.dataSource = self
        
        mSelectCategoryTf.inputView = categoryPicker
        mSelectCategoryTf.inputAccessoryView = toolBar
     
        self.getCategories()
        
    }
    
    @objc func pickerDoneButtonAction(){
        mSelectCategoryTf.resignFirstResponder()
    }
    
    @objc func pickercancelClick(){
        mSelectCategoryTf.resignFirstResponder()
    }
    
    func getCategories() {
        
        let header = NSMutableDictionary.init(dictionary: ["Content-Type" : "application/json"])
        WebService.sharedObject().callWebservice(urlString: APIs.CATEGORY, method: .get, dicHeader: header, dicParameters: [:], allowHud: false) { (response, error) in
            
            guard let data = response else { return }
               do {
                
                let decoder = JSONDecoder()
                let dictionary = data as! [NSDictionary]
                
                let jsonData: NSData = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
                if error == nil {
                    
                    self.mCategories = try decoder.decode([StructCategories].self, from: jsonData as Data)
                    
                }
                
               } catch let err {
                print("Err", err)
            }
            
        }
        
    }
    
    @IBAction func browseImgAction(_ sender: Any) {
    }
    
    @IBAction func unitAction(_ sender: Any) {
    }
    
    @IBAction func saveProductAction(_ sender: Any) {
    }
    
    @IBAction func cancelBtnAction(_ sender: Any) {
    }
    
}

extension AddProductViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return mCategories[row].categoryName
        }
        return ""
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return mCategories.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            self.mSelectCategoryTf.text = self.mCategories[row].categoryName
        }
    }
    
}
