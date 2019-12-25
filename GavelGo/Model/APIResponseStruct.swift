//
//  APIResponseStruct.swift
//  GavelGo
//
//  Created by mac on 25/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import Foundation
struct APIResponseStruct : Codable {
    let status: Int
    let timestamp: String
    let error: String
    let message: String
    let path: String
    
//    private enum CodingKeys: String, CodingKeys {
//        case status = ""
//        case timeStamp = ""
//        case error = ""
//        case message = ""
//        case message = ""
//    }
    
}
