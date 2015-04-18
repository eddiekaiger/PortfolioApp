//
//  BaseChildViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/17/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class BaseChildViewController: UIViewController, EKPageScrolling {
    
    var label: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.label.frame = CGRectMake(0, 200, self.view.width, 50)
        self.label.text = "Yo booooom"
        self.label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(self.label)
    }
    
    
    func onScrollWithPageOnLeft(offset: CGFloat) {
        self.label.transform = CGAffineTransformMakeScale(1 - offset, 1 - offset)
    }
    
    func onScrollWithPageOnRight(offset: CGFloat) {
        self.label.transform = CGAffineTransformMakeRotation(offset)
    }

}
