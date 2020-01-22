//
//  SelectCategoryViewController.swift
//  GavelGo
//
//  Created by mac on 31/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit

enum enumSelectCategoryType {
    case CATEGORY
    case SUBCATEGORY
}

protocol PSelectCategoryHandler {
    func onSelectCategoryCallBack(category: StructCategories)
    func onSelectSubCategoryCallBack(subCategory: StructSubCategories)
}

class SelectCategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var mTitle: UILabel!
}

class SelectCategoryViewController: UIViewController {
    
    //MARK:- SearchBar Declaration
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    var mSearchBar = UISearchBar()
    
    var mCategories = [StructCategories]()
    var mFilterCategories = [StructCategories]()
    var mSelectedCat: StructCategories?
    var mSubCategories = [StructSubCategories]()
    var mFilterSubCategories = [StructSubCategories]()
    var mSelectedSubCat: StructSubCategories?
    var categoryType: enumSelectCategoryType!
    var delegate: PSelectCategoryHandler?
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mNavigationItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        
        mTableView.delegate = self
        mTableView.dataSource = self
        
        mFilterCategories = mCategories
        mFilterSubCategories = mSubCategories
        
    }
    
    func setupSearchBar() {
        
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        self.searchController.searchBar.tintColor = .white
        self.searchController.searchBar.barTintColor = .white
        //searchController.searchBar.barStyle = .black
        self.searchController.searchBar.delegate = self
        
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            print("Inside TextField...")
            textfield.backgroundColor = .white
            
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = #colorLiteral(red: 0.03137254902, green: 0.6823529412, blue: 0.6196078431, alpha: 1)
            }

        }
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            searchController.hidesNavigationBarDuringPresentation = false
            mTableView.tableHeaderView = searchController.searchBar
        }
        self.definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func filterFunction(searchText : String) {
        print(searchText)
        
        if searchText.count > 0 {

            if categoryType == enumSelectCategoryType.CATEGORY {
                
                mFilterCategories.removeAll()
                mFilterCategories = mCategories.filter{ $0.categoryName.contains(searchText) }
                
            } else if categoryType == enumSelectCategoryType.SUBCATEGORY {
                
                mFilterSubCategories.removeAll()
                mFilterSubCategories = mSubCategories.filter{ $0.subCategoryName.contains(searchText) }
                
            }

        } else {

            if categoryType == enumSelectCategoryType.CATEGORY {
                
                mFilterCategories = mCategories
                
            } else if categoryType == enumSelectCategoryType.SUBCATEGORY {
                
                mFilterSubCategories = mSubCategories
                
            }
        }
        
        self.mTableView.reloadData()
        
    }

}

extension SelectCategoryViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        mSearchBar = searchBar
        //Show Cancel
        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.tintColor = .white
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        //Filter function
        self.filterFunction(searchText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //Hide Cancel
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        
        guard let term = searchBar.text , term.isEmpty == false else {
            
            //Notification "White spaces are not permitted"
            return
        }
        
        //Filter function
        self.filterFunction(searchText: term)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        //Hide Cancel
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = String()
        searchBar.resignFirstResponder()
        
        //Filter function
        self.filterFunction(searchText: searchBar.text!)
    }
    
}

extension SelectCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if categoryType == enumSelectCategoryType.CATEGORY {
            return mFilterCategories.count
        } else if categoryType == enumSelectCategoryType.SUBCATEGORY {
            return mFilterSubCategories.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCategoryTableViewCell") as! SelectCategoryTableViewCell
        if categoryType == enumSelectCategoryType.CATEGORY {
            let data = mFilterCategories[indexPath.row]
            cell.mTitle.text = data.categoryName
            if mSelectedCat?.categoryName == data.categoryName {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        } else if categoryType == enumSelectCategoryType.SUBCATEGORY {
            let data = mFilterSubCategories[indexPath.row]
            cell.mTitle.text = data.subCategoryName
            if mSelectedSubCat?.subCategoryName == data.subCategoryName {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if self.categoryType == enumSelectCategoryType.CATEGORY {
            self.delegate?.onSelectCategoryCallBack(category: mFilterCategories[indexPath.row])
        } else if categoryType == enumSelectCategoryType.SUBCATEGORY {
            delegate?.onSelectSubCategoryCallBack(subCategory: mFilterSubCategories[indexPath.row])
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
