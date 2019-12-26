//
//  StructCategories.swift
//  GavelGo
//
//  Created by mac on 27/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import Foundation

struct StructCategories: Codable {
    let categoryId: Int
    let categoryName: String
    let active: Bool
    let modifiedBy: String //last_MODIFIED_USER_NM
    let modifiedDate: String //last_MODIFIED_DT
    let createdUser: String //created_USER_NM
    let createdDate: String //created_DT
    
    private enum CodingKeys: String, CodingKey {
        case categoryId
        case categoryName
        case active
        case modifiedBy = "last_MODIFIED_USER_NM"
        case modifiedDate = "last_MODIFIED_DT"
        case createdUser = "created_USER_NM"
        case createdDate = "created_DT"
    }
    
}
