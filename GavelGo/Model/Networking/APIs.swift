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
    static let BASE_URL_M = "http://jessgo.mr47w8dp7c.us-east-2.elasticbeanstalk.com/mlogin/"
    
    //MARK: GET METHODS
    static let GET_CATEGORY = APIs.BASE_URL + "category"
    static let GET_SUB_CATEGORY = APIs.BASE_URL + "subCategory"
    static let GET_PRODUCT = APIs.BASE_URL + "product"
    static let GET_PRODUCT_BY_ID = APIs.BASE_URL + "product/byId/" //Id
    static let GET_PRODUCT_BY_CATEGORY = APIs.BASE_URL + "product/byCategory/" //(categoryId is a number, like 1,2,3)
    static let GET_PRODUCT_PHOTO_INFO = APIs.BASE_URL + "prodPhoto"
    static let GET_ROLE = APIs.BASE_URL + "role"
    static let GET_USER_INFO = APIs.BASE_URL + "getUser"
    static let GET_SUPPORT_INFO = APIs.BASE_URL + "support"
    
    //MARK: POST METHODS
    static let POST_AUTH = APIs.BASE_URL + "authenticate" //To get token
    static let POST_REGISTER_NEW_USER = APIs.BASE_URL + "register" //username,password
    static let POST_REGISTER_NEW_PARTNER = APIs.BASE_URL + "regPartner" //username,password
    static let POST_LOGIN = APIs.BASE_URL_M + "login" //username,password
    static let POST_ADD_ROLE = APIs.BASE_URL + "role" //"roleName":"SITE_PARTNER","description":"SITE PARTNER"
    static let POST_ADD_PRODUCT = APIs.BASE_URL + "product" //categoryId, categoryName, title, description, subCategoryId, subCategoryName, productOwner, userName
    static let POST_ADD_PRODUCT_PHOTO = APIs.BASE_URL + "productPhoto" //username, photoname, productId, productOwner ( + image file)
    static let POST_ADD_PARTNER = APIs.BASE_URL + "regPartner" //username, password, email
    static let POST_ADD_SUPPORT_INFO = APIs.BASE_URL + "support" //username, useremail, useremail, subject
    
    //MARK: DELETE METHODS
    static let DELETE_PRODUCT = APIs.BASE_URL + "product" //Id
    static let DELETE_PRODUCT_PHOTO = APIs.BASE_URL + "prodPhoto"
    static let DELETE_PHOTO_RELATION = APIs.BASE_URL + "prodPhotoR"
    static let DELETE_USER = APIs.BASE_URL + "deleteARegisteredUser"
    
}
