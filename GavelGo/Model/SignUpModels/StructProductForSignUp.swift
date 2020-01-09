//
//  StructProduct.swift
//  GavelGo
//
//  Created by mac on 10/01/20.
//  Copyright © 2020 Minder. All rights reserved.
//

import Foundation
import UIKit

struct StructProductForSignUp {
    let productName: String?
    let businessCategory: String?
    let subCategory: String?
    let price: String?
    let units: String?
    let address: [StructAddresses]?
    let description: String?
    let images: [UIImage]?
    let keywords: [String]?
    let highlights: String?
    var isActive: Bool?
}
