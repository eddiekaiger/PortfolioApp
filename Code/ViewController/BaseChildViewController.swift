//
//  BaseChildViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/17/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class BaseChildViewController: UIViewController {
//    
//    /**
//        The
//    */
//    var animatingViews : [UIView] = []
    
    var label: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.label.frame = CGRectMake(0, 200, self.view.width, 50)
        self.label.text = "Yo booooom"
        self.label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(self.label)
    }
    
    
    /**
    Update view when part of it is on the left page currently visible.
    @param offset A value between 0 and 1 (0 meaning page is fully visible, 1 meaning page is completely to the left of the visible page)
    */
    func onViewFractionallyLeft(offset: CGFloat) {
        
        self.label.transform = CGAffineTransformMakeScale(1 - offset, 1 - offset)
        
    }
    
    /**
    Update view when part of it is on the right page currently visible.
    @param offset A value between -1 and 0 (0 meaning page is fully visible, -1 meaning page is completely to the right of the visible page)
    */
    func onViewFractionallyRight(offset: CGFloat) {
        
        self.label.transform = CGAffineTransformMakeRotation(offset)
        
    }

}
