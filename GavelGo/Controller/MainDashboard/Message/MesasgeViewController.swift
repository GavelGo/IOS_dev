//
//  MesasgeViewController.swift
//  GavelGo
//
//  Created by mac on 22/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit

class MesasgeViewController: UIViewController {

    //MARK:- SearchBar Declaration
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    var mSearchBar = UISearchBar()
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mContact: UIButton!
    @IBOutlet weak var mChatModuleSelectionView: UIView!
    @IBOutlet weak var mSelectionViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mContact.layer.cornerRadius = 22.5
        
        self.parent?.navigationItem.title = "Messages"
        
        // if providers chat mSelectionViewHeight = 40
        // if consumers chat mSelectionViewHeight = 0
        
        mTableView.delegate = self
        mTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupSearchBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.parent?.navigationItem.searchController = nil
    }
    
    @IBAction func chatAction(_ sender: Any) {
    }
    
    @IBAction func reviewAction(_ sender: Any) {
    }
    
    func setupSearchBar() {
        
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        self.searchController.searchBar.tintColor = #colorLiteral(red: 0.03137254902, green: 0.6823529412, blue: 0.6196078431, alpha: 1)
        self.searchController.searchBar.barTintColor = #colorLiteral(red: 0.03137254902, green: 0.6823529412, blue: 0.6196078431, alpha: 1)
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
            self.parent?.navigationItem.searchController = searchController
        } else {
            searchController.hidesNavigationBarDuringPresentation = false
            mTableView.tableHeaderView = searchController.searchBar
        }
        self.definesPresentationContext = true
        self.parent?.navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func filterFunction(searchText : String) {
        print(searchText)
        
        if searchText.count > 0 {

            

        } else {

            
        }
        
        self.mTableView.reloadData()
        
    }


}

extension MesasgeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return CellMessage()
    }
    
}

extension MesasgeViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        mSearchBar = searchBar
        //Show Cancel
        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.tintColor = #colorLiteral(red: 0.03137254902, green: 0.6823529412, blue: 0.6196078431, alpha: 1)
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

class CellMessageHeader: UITableViewCell {
    @IBOutlet weak var mTitle: UILabel!
}

class CellMessage: UITableViewCell {
    @IBOutlet weak var mStatus: UIView!
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mUserName: UILabel!
    @IBOutlet weak var mMessage: UILabel!
}
