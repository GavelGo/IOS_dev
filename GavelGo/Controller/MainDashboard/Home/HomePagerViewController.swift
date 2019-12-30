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
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
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
