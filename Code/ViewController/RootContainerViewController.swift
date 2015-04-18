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
    
    var pages = [BaseChildViewController]()
    
    var one = BaseChildViewController()
    var two = BaseChildViewController()
    
    var contentWidth: CGFloat { return CGFloat(self.pages.count) * self.view.width }
    var pageWidth: CGFloat { return self.view.width }
    
    
//    convenience init(pages: [UIViewController]) {
//        self.init()
//    }
    
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
        self.scrollView.contentSize.width = self.contentWidth
        self.scrollView.contentSize.height = self.view.height
        
        for i in 0..<self.pages.count {
            pages[i].view.frame = CGRectMake(CGFloat(i) * self.view.width, 0, self.view.width, self.view.height)
        }
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x
        
        let positionX: CGFloat = offsetX / self.pageWidth
        
        // Calcualte left and right page index
        let leftPageIndex: Int = Int(floor(positionX))
        let rightPageIndex: Int = leftPageIndex + 1
        
        // Calculate offset for left and right pages
        let leftOffset: CGFloat = positionX - floor(positionX)  // Between 0 and 1
        let rightOffset: CGFloat = -1 + leftOffset              // Between -1 and 0
        
        if leftPageIndex >= 0 {
            pages[leftPageIndex].onViewFractionallyLeft(leftOffset)
        }
        
        if rightPageIndex < self.pages.count {
            pages[rightPageIndex].onViewFractionallyRight(rightOffset)
        }
        
        
//        NSLog("Scrollview offset: %.2f", scrollView.contentOffset.x)
    }
}
