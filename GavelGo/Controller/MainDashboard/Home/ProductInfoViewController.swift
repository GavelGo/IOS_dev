//
//  ProductInfoViewController.swift
//  GavelGo
//
//  Created by mac on 24/12/19.
//  Copyright © 2019 Minder. All rights reserved.
//

import UIKit
import ImageSlideshow
import SDWebImage
import FloatRatingView
import FaveButton

class ProductInfoViewController: UIViewController {
    
    @IBOutlet weak var mImageSlider: ImageSlideshow!
    @IBOutlet weak var mProductInfo: UILabel!
    @IBOutlet weak var mUserimg: UIImageView!
    @IBOutlet weak var mUserName: UILabel!
    @IBOutlet weak var mUserStarView: FloatRatingView!
    @IBOutlet weak var mDescription: UILabel!
    @IBOutlet weak var mGetThisDealView: UIView!
    @IBOutlet weak var mContactView: UIView!
    @IBOutlet weak var mFavBtn: FaveButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = false
        
//        let callImage   = #imageLiteral(resourceName: "app_logo")
//        let videoImage   = #imageLiteral(resourceName: "app_logo")
//        let searchImage = #imageLiteral(resourceName: "app_logo")
//
//        let callButton   = UIBarButtonItem(image: callImage,  style: .plain, target: self, action: #selector(didTapCallButton))
//        let videoButton = UIBarButtonItem(image: videoImage,  style: .plain, target: self, action: #selector(didTapVideoButton))
//        let searchButton = UIBarButtonItem(image: searchImage,  style: .plain, target: self, action: #selector(didTapSearchButton))
//
//        navigationItem.rightBarButtonItems = [callButton, videoButton, searchButton]
        
        let editImage    = UIImage(systemName: "arrowshape.turn.up.right.fill")

        let share   = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: #selector(shareBtnAction(_:)))
        //let searchButton = UIBarButtonItem(image: searchImage,  style: .plain, target: self, action: "didTapVideoButton:")

        navigationItem.rightBarButtonItems = [share]
        
        setupImageSlider()
        
        mGetThisDealView.themeSaveBtn()
        mContactView.themeSaveBtn()
        
    }
    
    @objc func shareBtnAction(_ sender: AnyObject){
        print("Call Btn Clicked...")
    }
    
    @IBAction func getThisDealAction(_ sender: Any) {
    }
    
    func setupImageSlider() {
        
        mImageSlider.slideshowInterval = 5.0
        mImageSlider.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        mImageSlider.contentScaleMode = UIViewContentMode.scaleAspectFill

        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.1333333333, green: 0.5490196078, blue: 0.1333333333, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        mImageSlider.pageIndicator = pageControl

        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        mImageSlider.activityIndicator = DefaultActivityIndicator()
        mImageSlider.delegate = self
        
        let img1 = SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!
        let img2 = SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!
        let img3 = SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!

        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        mImageSlider.setImageInputs([img1, img2, img3])

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        mImageSlider.addGestureRecognizer(recognizer)
        
    }
    
    @objc func didTap() {
        let fullScreenController = mImageSlider.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    @IBAction func contactSellerAction(_ sender: Any) {
    }
    
    @IBAction func favBtnAction(_ sender: Any) {
    }
    
}

extension ProductInfoViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        //print("current page:", page)
    }
}
