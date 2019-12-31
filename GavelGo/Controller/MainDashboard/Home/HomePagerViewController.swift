//
//  HomePagerViewController.swift
//  GavelGo
//
//  Created by mac on 31/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import Foundation
import PolioPager
import UIKit

class HomePagerViewController: PolioPagerViewController {
    
    override func viewDidLoad() {
        
        //selectedBar
        self.selectedBarHeight = 2
        self.selectedBar.layer.cornerRadius = 0
        self.selectedBar.backgroundColor = .gray
        
        //cells
        self.eachLineSpacing = 0
        
        setupNavigationBar()
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.navigationBar.isHidden = true
    }
    
    func setupNavigationBar() {
        
        let profileImg    = UIImage(systemName: "person.crop.circle.fill")
        let profileItem   = UIBarButtonItem(image: profileImg,  style: .plain, target: self, action: #selector(profileBtnAction(_:)))
        self.parent?.navigationItem.leftBarButtonItems = [profileItem]
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "location.fill"), for: .normal)
        button.setTitle("Nearby", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(locationBtnAction(_:)), for: .touchUpInside)
        let locationItem = UIBarButtonItem(customView: button)
        //let locationImg    = UIImage(systemName: "location.fill")
        //let locationItem   = UIBarButtonItem(image: locationImg,  style: .plain, target: self, action: #selector(locationBtnAction(_:)))
        self.parent?.navigationItem.rightBarButtonItems = [locationItem]
        
    }
    
    @objc func profileBtnAction(_ sender: AnyObject){
        
    }
    
    @objc func locationBtnAction(_ sender: AnyObject){
        
    }
    
    override func tabItems() -> [TabItem] {
        return [TabItem(title: "Most popular"), TabItem(title: "Entertaintment"), TabItem(title: "Restaurant"), TabItem(title: "More")] //, TabItem(title: "Auto")
    }

    override func viewControllers() -> [UIViewController] {
        
        let searchView = storyboard!.instantiateViewController(withIdentifier: "HomeSearchViewController")
        
        //let mostPopular = storyboard!.instantiateViewController(withIdentifier: "MostPopularViewController")
        
        let mostPopular = storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        mostPopular.mNavigationViewController = self.navigationController
        
        let entertaintment = storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        entertaintment.mNavigationViewController = self.navigationController
        
        let resturant = storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        resturant.mNavigationViewController = self.navigationController
        
        //let auto = storyboard!.instantiateViewController(withIdentifier: "HomeViewController")
        
        let more = storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        more.mNavigationViewController = self.navigationController

        return [searchView, mostPopular, entertaintment, resturant, more]

    }
    
}
