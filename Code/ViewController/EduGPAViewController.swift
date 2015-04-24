//
//  EduGPAViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class EduGPAViewController: BaseChildViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gpaLabel: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()

        configureTitleLabel()
        configureGPALabel()
    }
    
    // MARK: - Configure
    
    func configureTitleLabel() {
        self.titleLabel.text = "Cumulative GPA:"
        self.titleLabel.textColor = self.defaultTextColor
        self.titleLabel.textAlignment = .Center
        self.titleLabel.font = UIFont.font(EKFontType.Bold, fontSize: 25)
    }
    
    func configureGPALabel() {
        self.gpaLabel.text = "3.8"
        self.gpaLabel.textColor = self.defaultTextColor
        self.gpaLabel.textAlignment = .Center
        self.gpaLabel.font = UIFont.font(EKFontType.Bold, fontSize: 100)
    }

    // MARK: - EKScrollingDelegate
    
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        self.gpaLabel.alpha = 1 - (offset * 2);
        self.gpaLabel.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(-offset * self.view.width, 0), 1+offset, 1+offset)
    }

    override func onScrollWithPageOnLeft(offset: CGFloat) {
        self.titleLabel.transform = CGAffineTransformMakeTranslation(offset * self.view.width, -offset * self.view.height)
        self.gpaLabel.transform = CGAffineTransformMakeTranslation(offset * self.view.width, offset * self.view.height)
    }
}
