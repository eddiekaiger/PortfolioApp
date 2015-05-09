//
//  ExpWeeblyViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class ExpWeeblyViewController: BaseChildViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureLogoImageView()
        configureDescriptionLabel()
    }
    
    // MARK: - Configure
    
    private func configureLogoImageView() {
        self.logoImageView.layer.borderColor = UIColor.whiteColor().CGColor
        self.logoImageView.layer.borderWidth = 2
    }
    
    private func configureDescriptionLabel() {
        self.descriptionLabel.text = "This summer, I will be interning as an iOS Developer at Weebly, Inc. I will be writing code in Swift and Objective-C for their iPhone and iPad applications."
        self.descriptionLabel.textColor = self.defaultTextColor
        self.descriptionLabel.textAlignment = .Center
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.font(EKFontType.Light, fontSize: 20)
    }
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        self.logoImageView.alpha = 1 - offset
        self.descriptionLabel.alpha = 1 - offset
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        self.logoImageView.transform = CGAffineTransformMakeRotation(-offset * CGFloat(M_PI))
        self.descriptionLabel.transform = CGAffineTransformMakeRotation(offset * CGFloat(M_PI))
    }

}
