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
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // Default image
    var backgroundImage = UIImage(named: "City.png")!
    let imageSideOffset: CGFloat = 50
    let imageShiftRatio: CGFloat = 0.25
    
    // View controllers used as pages
    var pages = [UIViewController]()
    
    var one = BaseChildViewController()
    var two = BaseChildViewController()
    var three = BaseChildViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundImageView.image = self.backgroundImage
        self.backgroundImageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        self.scrollView.backgroundColor = UIColor(white: 0, alpha: 0.6)
        
        one.view.backgroundColor = UIColor.clearColor()
        
        self.addChildViewController(one)
        self.scrollView.addSubview(one.view)
        one.didMoveToParentViewController(self)
        
        self.pages.append(one)
        
        
        self.addChildViewController(two)
        self.scrollView.addSubview(two.view)
        two.didMoveToParentViewController(self)
        two.view.backgroundColor = UIColor.clearColor()
        
        self.pages.append(two)
        
        self.addChildViewController(three)
        self.scrollView.addSubview(three.view)
        three.didMoveToParentViewController(self)
        three.view.backgroundColor = UIColor.clearColor()
        
        self.pages.append(three)
        
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
        
        // Calculate how big our imageview needs to be for parallax to work well; the more pages we have, the larger the image
        let imageWidth: CGFloat = CGFloat(self.pages.count-1) * imageShiftRatio *
            (self.scrollView.contentSize.width - self.view.width) + (imageSideOffset * 2) + self.view.width

        // Adjust imageview height based on calculated width
        let imageHeight: CGFloat = self.backgroundImage.size.height * imageWidth / self.backgroundImage.size.width
        
        // Set imageview frame
        self.backgroundImageView.frame = CGRectMake(-scrollView.contentOffset.x - imageSideOffset, 0, imageWidth, imageHeight)
    }
    
    // MARK: UIScrollView Delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        // Get exact page position (e.g. 2.5)
        let positionX: CGFloat = scrollView.contentOffset.x / self.view.width
        
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
        
        // Adjust background parallax
        self.backgroundImageView.left = -self.scrollView.contentOffset.x * imageShiftRatio - imageSideOffset
    }
    
    
    // MARK: Actions
    
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
