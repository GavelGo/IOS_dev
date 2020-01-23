//
//  HomeViewController.swift
//  GavelGo
//
//  Created by mac on 22/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import SDWebImage
import CoreLocation
import Toast_Swift
import MaterialComponents

class HomeViewController: UIViewController {

//    @IBOutlet weak var mUserProfileImageView: UIImageView!
//    @IBOutlet weak var mSearchView: UIView!
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    var mNavigationViewController: UINavigationController?
    var mData = [StructProduct]()
    var locationManager: CLLocationManager = CLLocationManager.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mSearchView.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
//        mSearchView.layer.borderWidth = 0.5
//        mSearchView.layer.cornerRadius = 3
        
        mCollectionView.delegate = self
        mCollectionView.dataSource = self
        
//        if let layout = mCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//
//            layout.minimumLineSpacing = 10
//            layout.minimumInteritemSpacing = 10
//            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//            let size = CGSize(width: (mCollectionView.bounds.width-30)/2, height: mCollectionView.bounds.height)
//            layout.itemSize = size
//
//        }
        
        
//        let cellWidth : CGFloat = mCollectionView.frame.size.width / 3.0 - 8
//        let cellheight : CGFloat = 195
//        let cellSize = CGSize(width: cellWidth , height:cellheight)
        
        let noOfCellsInRow = 3

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        layout.minimumLineSpacing = 4.0
        layout.minimumInteritemSpacing = 4.0
        
        let totalSpace = layout.sectionInset.left
            + layout.sectionInset.right
            + (layout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((mCollectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        let cellSize = CGSize(width: size, height: 190)
        layout.itemSize = cellSize
        
        mCollectionView.setCollectionViewLayout(layout, animated: true)

        getProducts()
        //requestLocationService()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.parent?.navigationItem.rightBarButtonItems = nil
    }

    func setupNavigationBar() {
        
        let profileImg    = UIImage(systemName: "person.crop.circle.fill")
        let profileItem   = UIBarButtonItem(image: profileImg,  style: .plain, target: self, action: #selector(profileBtnAction(_:)))
        navigationItem.rightBarButtonItems = [profileItem]
        self.parent?.navigationItem.rightBarButtonItems = [profileItem]
        
        let locationImg    = UIImage(systemName: "location.fill")
        let locationItem   = UIBarButtonItem(image: locationImg,  style: .plain, target: self, action: #selector(locationBtnAction(_:)))
        //navigationItem.leftBarButtonItems = [locationItem]
        
    }
    
    @objc func profileBtnAction(_ sender: AnyObject){
        
    }
    
    @objc func locationBtnAction(_ sender: AnyObject){
        
    }
    
    func requestLocationService() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        } else {
            self.navigationController?.view.makeToast("Please Enable Location Service")
        }
    }
    
    func getProducts() {
        
        WebService.sharedObject().callWebservice(urlString: APIs.GET_PRODUCT, method: .get, dicParameters: nil, allowHud: false) { (response, error) in
            
            guard let data = response else { return }
            do {
                let decoder = JSONDecoder()
                let dictionary = data as! [NSDictionary]
                let jsonData: NSData = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
                if error == nil {
                    self.mData = try decoder.decode([StructProduct].self, from: jsonData as Data)
                    self.mCollectionView.reloadData()
                } else {
                    //let resData = try decoder.decode(APIResponseStruct.self, from: jsonData as Data)
                    print("Error : \(error)")
                    self.navigationController?.view.makeToast("Something Wrong!!")
                }
               } catch let err {
                print("Err", err)
            }
            
        }
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let size = CGSize(width: collectionView.bounds.size.width/3 - 10, height: collectionView.bounds.size.height - 10)
//        print("Cell Size Changed.... \(size)")
//          return size
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = CGSize(width: collectionView.bounds.size.width/3 - 10, height: collectionView.bounds.size.height - 10)
//        print("Cell Size Changed.... \(size)")
//        return size
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        let data = mData[indexPath.item]
        
        cell.mImageView.sd_setImage(with: URL(string: data.photos?.first?.photopath ?? ""), completed: nil)
        let price = data.price!
        cell.mPrice.text = "$ \(String(describing: price))"
        cell.mName.text = data.title
        cell.mCategory.text = data.categoryName
        cell.mOwnerName.text = data.businessName
        
        // If you wanted to have the card show the selected state when tapped
        // then you need to turn isSelectable to true, otherwise the default is false.
        //cell.isSelectable = true
        
        cell.cornerRadius = 4
        cell.setShadowElevation(ShadowElevation(rawValue: 2), for: .normal)
        cell.setShadowColor(UIColor.gray, for: .highlighted)
        
        cell.contentView.layer.masksToBounds = true
        cell.layer.masksToBounds = false
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Click Product... \(storyboard)")
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductInfoViewController") as! ProductInfoViewController
        vc.mData = mData[indexPath.item]
        self.mNavigationViewController?.pushViewController(vc, animated: true)
        
    }
    
}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var locValue : CLLocationCoordinate2D = manager.location!.coordinate;
        let long = locValue.longitude;
        let lat = locValue.latitude;
        print("Lat : \(lat), Long : \(long)")
        let loadlocation = CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
}
