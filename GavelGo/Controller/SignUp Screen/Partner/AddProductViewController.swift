//
//  AddProductViewController.swift
//  GavelGo
//
//  Created by mac on 27/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import TagListView
import Toast_Swift

protocol PAddProductDelegate {
    func addNewProductCallBack(product: StructProductForSignUp)
}

class AddProductViewController: UIViewController {

    @IBOutlet weak var mScrollView: UIScrollView!
    @IBOutlet weak var mProductName: SkyFloatingLabelTextField!
    @IBOutlet weak var mSelectCategoryTf: SkyFloatingLabelTextField!
    @IBOutlet weak var mSelectSubCategoryTf: SkyFloatingLabelTextField!
    @IBOutlet weak var mProductImage1: UIButton!
    @IBOutlet weak var mProductImage2: UIButton!
    @IBOutlet weak var mProductImage3: UIButton!
    @IBOutlet weak var mPriceTf: UITextField!
    @IBOutlet weak var mUnitBtn: UIButton!
    @IBOutlet weak var mUnitTf: SkyFloatingLabelTextField!
    @IBOutlet weak var mSelectKeywords: SkyFloatingLabelTextField!
    @IBOutlet weak var mShortDescription: SkyFloatingLabelTextField!
    @IBOutlet weak var mProductDescription: UITextView!
    @IBOutlet weak var mSaveBtnView: UIView!
    @IBOutlet weak var mCancelBtnView: UIView!
    @IBOutlet weak var mSaveBtn: UIButton!
    @IBOutlet weak var mSaveAvtivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mTagView: TagListView!
    @IBOutlet weak var mAddressesCount: UILabel!
    
    var categoryPicker: UIPickerView!
    var subCategoryPicker: UIPickerView!
    var tagArray = [String]()
    var addressArray = [StructAddresses]()
    var mCategories = [StructCategories]()
    var mSelectedCat: StructCategories?
    var mSubCategories = [StructSubCategories]()
    var mSelectedSubCat: StructSubCategories?
    
    var signUpValues: StructSignUpValues!
    var delegate: PAddProductDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = .white
        mSaveBtnView.themeSaveBtn()
        mCancelBtnView.themeSaveBtn()
        
        mProductName.delegate = self
        mSelectKeywords.delegate = self
        
        mProductImage1.layer.borderWidth = 0.5
        mProductImage1.layer.borderColor = #colorLiteral(red: 0.1333333333, green: 0.5490196078, blue: 0.1333333333, alpha: 1)
        mProductImage1.layer.cornerRadius = 3
        
        mProductImage2.layer.borderWidth = 0.5
        mProductImage2.layer.borderColor = #colorLiteral(red: 0.1333333333, green: 0.5490196078, blue: 0.1333333333, alpha: 1)
        mProductImage2.layer.cornerRadius = 3
        
        mProductImage3.layer.borderWidth = 0.5
        mProductImage3.layer.borderColor = #colorLiteral(red: 0.1333333333, green: 0.5490196078, blue: 0.1333333333, alpha: 1)
        mProductImage3.layer.cornerRadius = 3
        
        mPriceTf.keyboardType = .numberPad
        mUnitTf.keyboardType = .numberPad
        
//        let toolBar = UIToolbar()
//        toolBar.barStyle = .default
//        toolBar.isTranslucent = true
//        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
//        toolBar.sizeToFit()
//
//        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.pickerDoneButtonAction))
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.pickercancelClick))
//
//        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
//        toolBar.isUserInteractionEnabled = true
//
//        categoryPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
//        categoryPicker.backgroundColor = .white
//        categoryPicker.tag = 1
//
//        categoryPicker.delegate = self
//        categoryPicker.dataSource = self
//
//        mSelectCategoryTf.inputView = categoryPicker
//        mSelectCategoryTf.inputAccessoryView = toolBar
//
//        let toolBar1 = UIToolbar()
//        toolBar1.barStyle = .default
//        toolBar1.isTranslucent = true
//        toolBar1.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
//        toolBar1.sizeToFit()
//
//        let doneButton1 = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.pickerDoneButtonActionForSubCate))
//        let spaceButton1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
//        let cancelButton1 = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.pickercancelClickForSubCate))
//
//        toolBar1.setItems([cancelButton1, spaceButton1, doneButton1], animated: false)
//        toolBar1.isUserInteractionEnabled = true
//
//        subCategoryPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
//        subCategoryPicker.backgroundColor = .white
//        subCategoryPicker.tag = 2
//
//        subCategoryPicker.delegate = self
//        subCategoryPicker.dataSource = self
//
//        mSelectSubCategoryTf.inputView = subCategoryPicker
//        mSelectSubCategoryTf.inputAccessoryView = toolBar1
        
        mSaveBtn.isHidden = false
        mSaveAvtivityIndicator.isHidden = true
        
        self.getCategories()
        self.getSubCategories()
        
        mAddressesCount.text = ""
        mTagView.delegate = self
        
    }
    
    @objc func pickerDoneButtonAction(){
        if mSelectedCat == nil {
            self.mSelectCategoryTf.text = self.mCategories[0].categoryName
            self.mSelectedCat = self.mCategories[0]
        }
        mSelectCategoryTf.resignFirstResponder()
    }
    
    @objc func pickercancelClick(){
        mSelectCategoryTf.resignFirstResponder()
    }
    
    @objc func pickerDoneButtonActionForSubCate(){
        if mSelectedSubCat == nil {
            self.mSelectSubCategoryTf.text = self.mSubCategories[0].subCategoryName
            self.mSelectedSubCat = self.mSubCategories[0]
        }
        mSelectSubCategoryTf.resignFirstResponder()
    }
    
    @objc func pickercancelClickForSubCate(){
        mSelectSubCategoryTf.resignFirstResponder()
    }
    
    func getCategories() {
        self.mSelectCategoryTf.isEnabled = false
        WebService.sharedObject().callWebservice(urlString: APIs.GET_CATEGORY, method: .get, dicParameters: nil, allowHud: false) { (response, error) in
            guard let data = response else { return }
               do {
                let decoder = JSONDecoder()
                let dictionary = data as! [NSDictionary]
                let jsonData: NSData = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
                if error == nil {
                    self.mSelectCategoryTf.isEnabled = true
                    self.mCategories = try decoder.decode([StructCategories].self, from: jsonData as Data)
                }
               } catch let err {
                print("Err", err)
            }
        }
    }
    
    func getSubCategories() {
        self.mSelectSubCategoryTf.isEnabled = false
        WebService.sharedObject().callWebservice(urlString: APIs.GET_SUB_CATEGORY, method: .get, dicParameters: nil, allowHud: false) { (response, error) in
            guard let data = response else { return }
               do {
                let decoder = JSONDecoder()
                let dictionary = data as! [NSDictionary]
                let jsonData: NSData = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
                if error == nil {
                    self.mSelectSubCategoryTf.isEnabled = true
                    self.mSubCategories = try decoder.decode([StructSubCategories].self, from: jsonData as Data)
                }
               } catch let err {
                print("Err", err)
            }
        }
    }
    
    @IBAction func browseImgAction(_ sender: UIButton) {
        
        JCUIImagePickerManager.sharedInstance.pickImageFrom(allowsEditing: true, sourceType: .photoLibrary, target: self) { (info, error) in
            if error == nil {
                
                let img = info?[.editedImage] as? UIImage
                print("Image Loaded : Tag - \(sender.tag)")
                switch sender.tag {
                case 0:
                    print("Image Loaded : Tag - 0 :  \(sender.tag)")
                    self.mProductImage1.setImage(img, for: .normal)
                    break
                case 1:
                    self.mProductImage2.setImage(img, for: .normal)
                    break
                case 2:
                    self.mProductImage3.setImage(img, for: .normal)
                    break
                default:
                    break
                }
                
            }
        }
        
    }
    
    @IBAction func openAddressesAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "AddressesViewController") as! AddressesViewController
        vc.addressArray = self.addressArray
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func unitAction(_ sender: Any) {
    }
    
    @IBAction func saveProductAction(_ sender: Any) {
        
        let productName = mProductName.text?.trimmingCharacters(in: .whitespaces)
        let category = mSelectCategoryTf.text?.trimmingCharacters(in: .whitespaces)
        let subCategory = mSelectSubCategoryTf.text?.trimmingCharacters(in: .whitespaces)
        let price = mPriceTf.text?.trimmingCharacters(in: .whitespaces)
        let units = mUnitTf.text?.trimmingCharacters(in: .whitespaces)
        let description = mProductDescription.text.trimmingCharacters(in: .whitespaces)
        let shortDescription = mShortDescription.text?.trimmingCharacters(in: .whitespaces)
        
        resetValidation()
        
        if productName!.isEmpty {
            mProductName.errorMessage = "Please Enter Product Name"
            return
        } else if category!.isEmpty {
            mSelectCategoryTf.errorMessage = "Please Select Business Category"
            return
        } else if subCategory!.isEmpty {
            mSelectSubCategoryTf.errorMessage = "Please Select Subcategory"
            return
        } else if price!.isEmpty {
            mPriceTf.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            self.navigationController?.view.makeToast("Please Enter Price")
            return
        } else if units!.isEmpty {
            mUnitTf.errorMessage = "Please Enter Units"
            return
        } else if description.isEmpty {
            mProductDescription.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            self.navigationController?.view.makeToast("Please Enter Description")
            return
        } else if shortDescription!.isEmpty {
            mShortDescription.errorMessage = "Please Enter Short Description"
            return
        }
        
        if addressArray.isEmpty {
            self.navigationController?.view.makeToast("Please Enter Address")
            return
        }
        
        if tagArray.isEmpty {
            self.navigationController?.view.makeToast("Please Select Keywords")
            return
        }
        
        let img1 = mProductImage1.imageView?.image
        let img2 = mProductImage2.imageView?.image
        let img3 = mProductImage3.imageView?.image
        
//        if img1?.accessibilityIdentifier == nil || img2?.accessibilityIdentifier == nil || img3?.accessibilityIdentifier == nil {
//            mProductImage1.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
//            mProductImage2.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
//            mProductImage3.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
//            self.navigationController?.view.makeToast("Please Add Product Images")
//            return
//        }
        
        let imgArray = [img1, img2, img3]
        
        let product = StructProductForSignUp(productName: productName, businessCategory: category, subCategory: subCategory, price: price, units: units, address: addressArray, description: description, images: (imgArray as! [UIImage]), keywords: tagArray, highlights: shortDescription, isActive: true)
        
        delegate.addNewProductCallBack(product: product)
        navigationController?.popViewController(animated: true)
        //addProduct()
    }
    
    func resetValidation() {
        mProductName.errorMessage = ""
        mSelectCategoryTf.errorMessage = ""
        mSelectSubCategoryTf.errorMessage = ""
        mPriceTf.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mUnitTf.errorMessage = ""
        mProductDescription.layer.borderColor = #colorLiteral(red: 0.9066892862, green: 0.9066892862, blue: 0.9066892862, alpha: 0.5034187478)
        mShortDescription.errorMessage = ""
        mProductImage1.layer.borderColor = #colorLiteral(red: 0.1333333333, green: 0.5490196078, blue: 0.1333333333, alpha: 1)
        mProductImage2.layer.borderColor = #colorLiteral(red: 0.1333333333, green: 0.5490196078, blue: 0.1333333333, alpha: 1)
        mProductImage3.layer.borderColor = #colorLiteral(red: 0.1333333333, green: 0.5490196078, blue: 0.1333333333, alpha: 1)
    }
    
    @IBAction func cancelBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectCategoryAction(_ sender: UIButton) {
        
        if sender.tag == 0 {
            // Category
            let vc = storyboard?.instantiateViewController(identifier: "SelectCategoryViewController") as! SelectCategoryViewController
            vc.mCategories = mCategories
            vc.categoryType = .CATEGORY
            vc.delegate = self
            vc.mSelectedCat = mSelectedCat
            vc.mNavigationItem.title = "Select Business Category"
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // Subcategory
            let vc = storyboard?.instantiateViewController(identifier: "SelectCategoryViewController") as! SelectCategoryViewController
            vc.mSubCategories = mSubCategories
            vc.categoryType = .SUBCATEGORY
            vc.delegate = self
            vc.mSelectedSubCat = mSelectedSubCat
            vc.mNavigationItem.title = "Select Subcategory"
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func addProduct() {
        
//        mSaveBtn.isHidden = false
//        mSaveAvtivityIndicator.isHidden = true
//        let params = NSMutableDictionary.init()
//        WebService.sharedObject().callWebservice(urlString: APIs.POST_ADD_PRODUCT, method: .post, dicParameters: params, allowHud: false) { (response, error) in
//
//        }
        
    }
    
}

extension AddProductViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return mCategories[row].categoryName
        } else if pickerView.tag == 2 {
            return mSubCategories[row].subCategoryName
        }
        return ""
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return mCategories.count
        } else if pickerView.tag == 2 {
            return mSubCategories.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            if !mCategories.isEmpty {
                self.mSelectCategoryTf.text = self.mCategories[row].categoryName
                self.mSelectedCat = self.mCategories[row]
            }
        } else if pickerView.tag == 2 {
            if !mSubCategories.isEmpty {
                self.mSelectSubCategoryTf.text = self.mSubCategories[row].subCategoryName
                self.mSelectedSubCat = self.mSubCategories[row]
            }
        }
    }
    
}

extension AddProductViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text?.trimmingCharacters(in: .whitespaces)
        if !text!.isEmpty {
            if textField.tag == 1 {
                tagArray.append(text!)
                mTagView.textFont = UIFont.systemFont(ofSize: 17)
                mTagView.removeAllTags()
                mTagView.addTags(tagArray)
                textField.text = ""
                return false
            }
        }
        self.view.endEditing(true)
        return false
    }
}

extension AddProductViewController: PSelectCategoryHandler {
    
    func onSelectCategoryCallBack(category: StructCategories) {
        self.mSelectCategoryTf.text = category.categoryName
        self.mSelectedCat = category
    }
    
    func onSelectSubCategoryCallBack(subCategory: StructSubCategories) {
        self.mSelectSubCategoryTf.text = subCategory.subCategoryName
        self.mSelectedSubCat = subCategory
    }
    
}

extension AddProductViewController: TagListViewDelegate {
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        for (index, item) in self.tagArray.enumerated() {
            if item == title {
                self.tagArray.remove(at: index)
                break
            }
        }
        self.mTagView.removeTag(title)
    }
}

extension AddProductViewController: PAddressesDelegate {
    
    func onAddressesCallBack(data: [StructAddresses]) {
        self.addressArray = data
        if data.isEmpty {
            self.mAddressesCount.text = ""
        } else {
            self.mAddressesCount.text = String(data.count)
        }
    }
    
}
