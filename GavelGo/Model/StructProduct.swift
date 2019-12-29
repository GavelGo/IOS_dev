//
//  StructProduct.swift
//  GavelGo
//
//  Created by mac on 29/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import Foundation

struct StructProduct: Codable {
    let productId: Int?
    let title: String?
    let description: String?
    let categoryName: String?
    let subCategoryName: String?
    let productOwner: String?
    let tags: String?
    let featured: Bool?
    let price: Int?
    let unit: Int?
    let highlights: String?
    let categoryId: Int?
    let subCategoryId: Int?
    let productKey: String?
    //let photos: [:]
    let active: Bool?
    let modifiedBy: String? //last_MODIFIED_USER_NM
    let modifiedDate: String? //last_MODIFIED_DT
    let createdUser: String? //created_USER_NM
    let createdDate: String? //created_DT
    
    private enum CodingKeys: String, CodingKey {
        case productId
        case title
        case description
        case categoryName
        case subCategoryName
        case productOwner
        case tags
        case featured
        case price
        case unit
        case highlights
        case categoryId
        case subCategoryId
        case productKey
        case active
        case modifiedBy = "last_MODIFIED_USER_NM"
        case modifiedDate = "last_MODIFIED_DT"
        case createdUser = "created_USER_NM"
        case createdDate = "created_DT"
    }
    
}
