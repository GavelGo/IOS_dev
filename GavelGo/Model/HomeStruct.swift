//
//  HomeStruct.swift
//  GavelGo
//
//  Created by mac on 22/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import Foundation

struct HomeStruct {
    let img: String
    let price: String
    let name: String
    let cat: String
    
    init(img: String, price: String, name: String, cat: String) {
        self.img = img
        self.price = price
        self.name = name
        self.cat = cat
    }
    
}
