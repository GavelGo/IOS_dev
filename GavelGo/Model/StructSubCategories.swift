//
//  StructSubCategories.swift
//  GavelGo
//
//  Created by mac on 28/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import Foundation

struct StructSubCategories: Codable {
    let subCategoryId: Int
    let subCategoryName: String
    let active: Bool
    let modifiedBy: String //last_MODIFIED_USER_NM
    let modifiedDate: String //last_MODIFIED_DT
    let createdUser: String //created_USER_NM
    let createdDate: String //created_DT
    
    private enum CodingKeys: String, CodingKey {
        case subCategoryId
        case subCategoryName
        case active
        case modifiedBy = "last_MODIFIED_USER_NM"
        case modifiedDate = "last_MODIFIED_DT"
        case createdUser = "created_USER_NM"
        case createdDate = "created_DT"
    }
}
