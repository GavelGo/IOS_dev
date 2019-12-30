//
//  Utils.swift
//  GavelGo
//
//  Created by mac on 22/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class setCustomColor {
    
    static let sharedInstance = setCustomColor()
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

extension UIImageView {

    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

extension String {
    
     func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
}

extension UIView {
    
    func themeSaveBtn() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 0.8571473394, alpha: 1)
    }
    
}

extension JSONDecoder {
  func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> Result<T> {
    guard response.error == nil else {
      print(response.error!)
      return .failure(response.error!)
    }

    guard let responseData = response.data else {
      print("didn't get any data from API")
      //return .failure(BackendError.parsing(reason: "Did not get data in response"))
        return .failure(response.error!)
    }

    do {
        print("Before Decoded Item : \(responseData)")
        let item = try decode(T.self, from: responseData)
        print("Decoded Item : \(item)")
        return .success(item)
    } catch {
        print("error trying to decode response")
        print(error)
        return .failure(error)
    }
  }
}
