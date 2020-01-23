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
    let businessName: String?
    let website: String?
    let tags: String?
    let featured: Bool?
    let price: Double?
    let unit: Int?
    let highlights: String?
    let categoryId: Int?
    let subCategoryId: Int?
    let productKey: String?
    let address1: String?
    let address2: String?
    let city: String?
    let state: String?
    let country: String?
    let zipcode: String?
    let longitude: Double?
    let latitude: Double?
    let photos: [StructProductPhoto]?
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
        case businessName
        case website
        case tags
        case featured
        case price
        case unit
        case highlights
        case categoryId
        case subCategoryId
        case productKey
        case address1
        case address2
        case city
        case state
        case country
        case zipcode
        case longitude
        case latitude
        case photos
        case active
        case modifiedBy = "last_MODIFIED_USER_NM"
        case modifiedDate = "last_MODIFIED_DT"
        case createdUser = "created_USER_NM"
        case createdDate = "created_DT"
    }
    
}

struct StructProductPhoto: Codable {
    let productPhotoId: Int?
    let caption: String?
    let photopath: String?
    let photoname: String?
    let productId: Int?
    let productOwner: String?
    let active: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case productPhotoId
        case caption
        case photopath
        case photoname
        case productId
        case productOwner
        case active
    }
    
}
