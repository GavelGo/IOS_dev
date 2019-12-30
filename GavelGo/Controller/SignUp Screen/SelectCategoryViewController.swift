//
//  SelectCategoryViewController.swift
//  GavelGo
//
//  Created by mac on 31/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit

class SelectCategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var mTitle: UILabel!
}

class SelectCategoryViewController: UIViewController {
    
    //MARK:- SearchBar Declaration
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    var mSearchBar = UISearchBar()
    
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        
    }
    
    func setupSearchBar() {
        
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        self.searchController.searchBar.tintColor = .white
        self.searchController.searchBar.barTintColor = .white
        //searchController.searchBar.barStyle = .black
        self.searchController.searchBar.delegate = self
        
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.blue
            if let backgroundview = textfield.subviews.first {

                // Background color
                backgroundview.backgroundColor = UIColor.white

                // Rounded corner
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func filterFunction(searchText : String) {
        print(searchText)
        
//        if searchText.count > 0 {
//
//            mTempData = [MExhibitors]()
//
//            for item in mData {
//
//                if item.companyName.lowercased().contains(searchText.lowercased()) {
//
//                    mTempData.append(item)
//
//                }
//
//            }
//
//            sortExhibitors()
//            //mTableView.reloadData()
//
//        } else {
//
//            mTempData = mData
//
//            sortExhibitors()
//
//            //mTableView.reloadData()
//
//        }
        
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
