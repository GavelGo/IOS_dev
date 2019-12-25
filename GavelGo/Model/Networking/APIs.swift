//
//  APIs.swift
//  GavelGo
//
//  Created by mac on 25/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import Foundation

class APIs {
    
    static let BASE_URL = "http://jessgo.mr47w8dp7c.us-east-2.elasticbeanstalk.com/"
    
    static let LOGIN = APIs.BASE_URL + "authenticate"
    static let REGISTER = APIs.BASE_URL + "register"
    static let CATEGORY = APIs.BASE_URL + "category"
    
}
