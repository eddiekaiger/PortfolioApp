//
//  BaseChildViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/17/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class BaseChildViewController: UIViewController, EKPageScrolling {
    
    var label = UILabel()
    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.imageView.frame = self.view.frame
//        self.imageView.image = UIImage(named: "City.png")
//        self.view.addSubview(self.imageView)
        
        // Do any additional setup after loading the view.
        
        self.label.frame = CGRectMake(0, 200, self.view.width, 350)
        self.label.text = "Purus fusce sagittis vitae lectus dapibus. Donec nulla. Purus metus nunc turpis diam nisl bibendum. Lorem nulla mollis turpis sem vestibulum phasellus enim ullamcorper rhoncus consectetuer elementum fames."
        self.label.textAlignment = NSTextAlignment.Center
        self.label.numberOfLines = 0
        self.label.textColor = UIColor.whiteColor()
        self.view.addSubview(self.label)
        
        
    }
    
    
    func onScrollWithPageOnLeft(offset: CGFloat) {
        
        self.label.transform = CGAffineTransformMakeScale(1 - offset, 1 - offset)
    }
    
    func onScrollWithPageOnRight(offset: CGFloat) {
        self.label.transform = CGAffineTransformMakeRotation(offset)
    }

}
