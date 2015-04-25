//
//  EduGraduationViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class EduGraduationViewController: BaseChildViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureTitleLabel()
        configureDateLabel()
    }
    
    // MARK: - Configure
    
    func configureTitleLabel() {
        self.titleLabel.text = "Expected Graduation Date:"
        self.titleLabel.textColor = self.defaultTextColor
        self.titleLabel.textAlignment = .Center
        self.titleLabel.font = UIFont.font(EKFontType.Bold, fontSize: 20)
    }
    
    func configureDateLabel() {
        self.dateLabel.text = "December 2015"
        self.dateLabel.textColor = self.defaultTextColor
        self.dateLabel.textAlignment = .Center
        self.dateLabel.font = UIFont.font(EKFontType.Bold, fontSize: 35)
    }
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        
        
        var transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(-offset * self.view.width, 0), 1-offset, 1-offset)
        
        self.titleLabel.transform = transform
        self.dateLabel.transform = transform
        
        self.titleLabel.alpha = 1 - offset
        self.dateLabel.alpha = 1 - offset
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        self.titleLabel.transform = CGAffineTransformMakeTranslation(offset * self.view.width, -offset * self.view.height)
        self.dateLabel.transform = CGAffineTransformMakeTranslation(offset * self.view.width, offset * self.view.height)
    }


}
