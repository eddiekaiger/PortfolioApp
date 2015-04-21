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

    let dismissButtonOffset: CGFloat = 70
    
    let defaultTextColor = UIColor.whiteColor()
    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clearColor()
    }
    
    
    // MARK: - EKScrollingDelegate
    
    /** IMPLEMENT IN SUBCLASS **/
    func onScrollWithPageOnLeft(offset: CGFloat) {}
    func onScrollWithPageOnRight(offset: CGFloat) {}

}
