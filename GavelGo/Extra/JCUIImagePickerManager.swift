//
//  JCUIImagePickerManager.swift
//  GavelGo
//
//  Created by mac on 26/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import Foundation
import UIKit
//MARK: - BlockDefination -
typealias JCUIImagePickerControllerBlock = ([UIImagePickerController.InfoKey : Any]?, Error?) -> Void

class JCUIImagePickerManager: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //MARK: - SharedInstance -
    static let sharedInstance : JCUIImagePickerManager = {
        let instance = JCUIImagePickerManager()
        return instance
    }()
    private var complitionHandler: JCUIImagePickerControllerBlock?
    
    //MARK: - ClassFunctions -
    func pickFrontImageFrom(allowsEditing: Bool, sourceType: UIImagePickerController.SourceType, target: UIViewController, complitionHandler: @escaping JCUIImagePickerControllerBlock) {
        self.complitionHandler = complitionHandler;
        if self.isPrivacyAllowed(sourceType: sourceType, mediaType: []){
            let imagePicker: UIImagePickerController = UIImagePickerController.init();
            imagePicker.allowsEditing = allowsEditing;
            
            if UIImagePickerController.isSourceTypeAvailable(sourceType) {
                imagePicker.sourceType = sourceType;
                imagePicker.cameraDevice = .front;
            }
            else {
                imagePicker.sourceType = .photoLibrary;
            }
            
            imagePicker.delegate = self;
            target.present(imagePicker, animated: true, completion: nil);
        }
        else
        {
            let error: NSError = NSError.init(domain: "Add appropriate privacy usage descriptions in Info.plist file.", code: -1, userInfo: nil)
            self.complitionHandler!(nil, error);
        }
        
    }
    func pickImageFrom(allowsEditing: Bool, sourceType: UIImagePickerController.SourceType, target: UIViewController, complitionHandler: @escaping JCUIImagePickerControllerBlock) {
        self.complitionHandler = complitionHandler;
        if self.isPrivacyAllowed(sourceType: sourceType, mediaType: []){
            let imagePicker: UIImagePickerController = UIImagePickerController.init();
            imagePicker.allowsEditing = allowsEditing;
            imagePicker.sourceType = sourceType;
            imagePicker.delegate = self;
            target.present(imagePicker, animated: true, completion: nil);
        }
        else
        {
            let error: NSError = NSError.init(domain: "Add appropriate privacy usage descriptions in Info.plist file.", code: -1, userInfo: nil)
            self.complitionHandler!(nil, error);
        }
        
    }
    func pickVideoFrom(allowsEditing: Bool, sourceType: UIImagePickerController.SourceType, target: UIViewController, complitionHandler: @escaping JCUIImagePickerControllerBlock) {
        self.complitionHandler = complitionHandler;
        if self.isPrivacyAllowed(sourceType: sourceType, mediaType: ["public.movie"]){
            let imagePicker: UIImagePickerController = UIImagePickerController.init();
            imagePicker.allowsEditing = allowsEditing;
            imagePicker.sourceType = sourceType;
            imagePicker.delegate = self;
            imagePicker.mediaTypes = ["public.movie"];
            target.present(imagePicker, animated: true, completion: nil);
        }
        else
        {
            let error: NSError = NSError.init(domain: "Add appropriate privacy usage descriptions in Info.plist file.", code: -1, userInfo: nil)
            self.complitionHandler!(nil, error);
        }
        
    }
    
    // MARK - Other -
    private func isPrivacyAllowed(sourceType: UIImagePickerController.SourceType, mediaType: [String]) -> Bool {
        var myDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            // Use your dict here
            switch sourceType
            {
            case .camera:
                if let _ = dict.object(forKey: "NSCameraUsageDescription"){
                    if mediaType.count > 0{
                        if let _ = dict.object(forKey: "NSMicrophoneUsageDescription"){
                            return true;
                        }
                        else {
                            return false;
                        }
                    }
                    return true;
                }
                else {
                    return false;
                }
            default:
                if let _ = dict.object(forKey: "NSPhotoLibraryUsageDescription"){
                    return true;
                }
                else {
                    return false;
                }
            }
        }
        else
        {
            return false;
        }
    }
    //MARK: - UIImagePickerControllerDelegate -
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.complitionHandler!(info, nil);
        picker.dismiss(animated: true, completion: nil);
        self.complitionHandler = nil;
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        let error: NSError = NSError.init(domain: "UIImagePickerController is canceled by user", code: -2, userInfo: nil)
        self.complitionHandler!(nil, error);
        picker.dismiss(animated: true, completion: nil);
        self.complitionHandler = nil;
    }
}
