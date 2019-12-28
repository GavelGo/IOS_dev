//
//  WebService.swift
//  GavelGo
//
//  Created by mac on 25/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

class WebService {
    
    static private var shared: WebService? = nil
    private var allowedAPILogs = true
    
    class func sharedObject() -> WebService {
        if shared == nil {
            shared = WebService();
        }
        return shared!;
    }
    
    func callWebservice(urlString: String, method: HTTPMethod, dicParameters: [String: Any], allowHud: Bool, complition: @escaping (_ response: Any?, _ err: Error?) -> Void)  {
        if self.allowedAPILogs {
            print("URL : ", urlString);
            print("Parameters : ", dicParameters);
        }
        if self.internetAvaibility() == false {
            let error = NSError.init(domain: "com.internet", code: -1992, userInfo: [
                "message": "Internet not avaiable"
                ])
            complition(nil, error);
            return;
        }
        
        if allowHud {
            self.showHUD();
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true;
        let request = Alamofire.request(urlString, method: method, parameters: dicParameters, encoding: JSONEncoding.default, headers: ["Content-Type" : "application/json"]).responseJSON {
            (dataResponse) in

            if allowHud {
                self.hideHUD();
            }
            if self.allowedAPILogs {
                print("Response : ", dataResponse.result.value);
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false;
            return complition(dataResponse.result.value, dataResponse.result.error);
        }
        
        request.downloadProgress {
            (progress) in
            print(progress.completedUnitCount, "/" ,progress.totalUnitCount)
        }
    }
    
    private func showHUD() {
        SVProgressHUD.show(withStatus: "Loading...");
        SVProgressHUD.setDefaultMaskType(.gradient);
    }
    private func hideHUD() {
        SVProgressHUD.dismiss();
    }
    
    func internetAvaibility() -> Bool {
        return (NetworkReachabilityManager()?.isReachable)!;
    }
    
}
