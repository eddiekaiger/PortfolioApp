//
//  AboutMeWWDCViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/19/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class AboutMeWWDCViewController: BaseChildViewController {

    
    @IBOutlet weak private var headerLabel: UILabel!
    @IBOutlet weak private var wwdcLabel: UILabel!

    override func viewDidLoad() {
        
        super.viewDidLoad()

        configureHeaderLabel()
        configureWWDCLabel()
    }

    // MARK: - Configure
    
    private func configureHeaderLabel() {
        self.headerLabel.text = "Oh, and I've always\nonly dreamed of attending"
        self.headerLabel.textAlignment = .Center
        self.headerLabel.textColor = self.defaultTextColor
        self.headerLabel.numberOfLines = 0
        self.headerLabel.font = UIFont.font(EKFontType.LightItalic, fontSize: 18)
    }
    
    private func configureWWDCLabel() {
        self.wwdcLabel.text = "WWDC"
        self.wwdcLabel.textColor = self.defaultTextColor
        self.wwdcLabel.textAlignment = .Center
        self.wwdcLabel.font = UIFont.font(EKFontType.Light, fontSize: 60)
    }

    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        self.headerLabel.transform = CGAffineTransformMakeRotation(offset * CGFloat(M_PI_2))
        self.wwdcLabel.transform = CGAffineTransformMakeRotation(-offset * CGFloat(M_PI_2))
    }
    
}
