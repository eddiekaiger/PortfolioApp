//
//  RootContainerViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/17/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class RootContainerViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak private var backgroundImageView: UIImageView!
    
    // Default image
    var backgroundImage = UIImage(named: "city.png")!
    private let imageSideOffset: CGFloat = 50
    private let imageShiftRatio: CGFloat = 0.25
    
    // View controllers used as pages
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackgroundImage()
        configureScrollView()
        
        self.view.clipsToBounds = true
        
        for i in 0...5 {
            var childVC = BaseChildViewController()
            self.addChildViewController(childVC)
            self.scrollView.addSubview(childVC.view)
            childVC.didMoveToParentViewController(self)
            childVC.view.backgroundColor = UIColor.clearColor()
            self.pages.append(childVC)
        }
    }
    
    override func viewDidLayoutSubviews() {

        super.viewDidLayoutSubviews()

        // Configure scrollview
        self.scrollView.frame = self.view.frame
        self.scrollView.contentSize.width = CGFloat(self.pages.count) * self.view.width
        self.scrollView.contentSize.height = self.view.height
        
        // Set position of all pages in scrollview
        for i in 0..<self.pages.count {
            pages[i].view.frame = CGRectMake(CGFloat(i) * self.view.width, 0, self.view.width, self.view.height)
        }
        
        // Calculate how big our imageview needs to be for parallax to work well
        let imageWidth: CGFloat = imageShiftRatio * (self.scrollView.contentSize.width - self.view.width) + (imageSideOffset * 2) + self.view.width

        // Adjust imageview height based on calculated width
        let imageHeight: CGFloat = self.backgroundImage.size.height * imageWidth / self.backgroundImage.size.width
        
        // Set imageview frame
        self.backgroundImageView.frame = CGRectMake(-scrollView.contentOffset.x - imageSideOffset,
            -((imageHeight / 2.0) - (self.view.height / 2.0)) / 2.0, imageWidth, imageHeight)
    }
    
    // MARK: Configure
    
    private func configureBackgroundImage() {
        self.backgroundImageView.image = self.backgroundImage
        self.backgroundImageView.contentMode = UIViewContentMode.ScaleAspectFill
    }
    
    private func configureScrollView() {
        self.scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        self.scrollView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.scrollView.indicatorStyle = UIScrollViewIndicatorStyle.White
    }
    
    // MARK: UIScrollView Delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offsetX: CGFloat = scrollView.contentOffset.x
        
        // Get exact page position (e.g. 2.5)
        let positionX: CGFloat = offsetX / self.view.width
        
        // Calculate left and right page index
        let leftPageIndex: Int = Int(floor(positionX))
        let rightPageIndex: Int = leftPageIndex + 1
        
        // Calculate offset for left and right pages
        let leftOffset: CGFloat = positionX - floor(positionX)
        let rightOffset: CGFloat = 1 - leftOffset
        
        // Notify left page about scroll
        if leftPageIndex >= 0 {
            (pages[leftPageIndex] as! EKPageScrolling).onScrollWithPageOnLeft(leftOffset)
        }
        
        // Notify right page about scroll
        if rightPageIndex < self.pages.count {
            (pages[rightPageIndex] as! EKPageScrolling).onScrollWithPageOnRight(rightOffset)
        }
        
        // Adjust background parallax (but stay within bounds)
        let imageLeftAdjust: CGFloat = -offsetX * imageShiftRatio - imageSideOffset
        if imageLeftAdjust < 0 && imageLeftAdjust + self.backgroundImageView.width > self.view.width {
            self.backgroundImageView.left = imageLeftAdjust
        }
    }
    
    
    // MARK: Actions
    
    @IBAction private func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
