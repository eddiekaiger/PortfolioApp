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
    
    var pages = [UIViewController]()
    
    var one = BaseChildViewController()
    var two = BaseChildViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        
        one.view.backgroundColor = UIColor.lightGrayColor()
        
        self.addChildViewController(one)
        self.scrollView.addSubview(one.view)
        one.didMoveToParentViewController(self)
        
        self.pages.append(one)
        
        
        self.addChildViewController(two)
        self.scrollView.addSubview(two.view)
        two.didMoveToParentViewController(self)
        two.view.backgroundColor = UIColor.redColor()
        
        self.pages.append(two)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.scrollView.frame = self.view.frame
        self.scrollView.contentSize.width = CGFloat(self.pages.count) * self.view.width
        self.scrollView.contentSize.height = self.view.height
        
        for i in 0..<self.pages.count {
            pages[i].view.frame = CGRectMake(CGFloat(i) * self.view.width, 0, self.view.width, self.view.height)
        }
        
    }
    
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
    }
}
