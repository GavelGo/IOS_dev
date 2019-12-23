//
//  HomeViewController.swift
//  GavelGo
//
//  Created by mac on 22/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {

    @IBOutlet weak var mUserProfileImageView: UIImageView!
    @IBOutlet weak var mSearchView: UIView!
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    var mData = [HomeStruct]()
    let imgUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTyNIYwGb2IPP06Rff8doyAD-rXBFBEWB26lgpN8LCIPPXWyQer"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        mSearchView.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        mSearchView.layer.borderWidth = 0.5
        mSearchView.layer.cornerRadius = 3
        
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        mData.append(HomeStruct(img: imgUrl, price: "$25", name: "Oil change", cat: "Panda oil"))
        
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
        
        
        let cellWidth : CGFloat = mCollectionView.frame.size.width / 3.0 - 8
        let cellheight : CGFloat = 195
        let cellSize = CGSize(width: cellWidth , height:cellheight)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        mCollectionView.setCollectionViewLayout(layout, animated: true)

        mCollectionView.reloadData()
        
        
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
        
        // If you wanted to have the card show the selected state when tapped
        // then you need to turn isSelectable to true, otherwise the default is false.
        //cell.isSelectable = true
        
        cell.cornerRadius = 4
        cell.shadowElevation(for: .selected)
        cell.setShadowColor(UIColor.black, for: .highlighted)
        
        let data = mData[indexPath.item]
        
        cell.mImageView.sd_setImage(with: URL(string: data.img), completed: nil)
        cell.mPrice.text = data.price
        cell.mName.text = data.name
        cell.mCategory.text = data.cat
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductInfoViewController") as! ProductInfoViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
