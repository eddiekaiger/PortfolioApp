//
//  ProjectsExaltedViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class ProjectsExaltedViewController: BaseChildViewController {

    
    @IBOutlet weak var screenshotImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureScreenshot()
        configureDescriptionLabel()
    }
    
    override func viewDidLayoutSubviews() {
        self.screenshotImageView.layer.cornerRadius = self.screenshotImageView.height / 2.0
    }
    
    // MARK: - Configure
    
    func configureScreenshot() {

        self.screenshotImageView.layer.borderWidth = 4
        self.screenshotImageView.layer.borderColor = UIColor.whiteColor().CGColor
        self.screenshotImageView.layer.masksToBounds = true
    }
    
    func configureDescriptionLabel() {
        self.descriptionLabel.text = "Exalted is a mobile application that serves as an intuitive, digital modern-day hymnal for contemporary Christian community worship.";
        self.descriptionLabel.textColor = self.defaultTextColor
        self.descriptionLabel.textAlignment = .Center
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.font(EKFontType.Light, fontSize: 17)
    }
    
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        self.screenshotImageView.transform = CGAffineTransformMakeScale(1 - offset, 1 - offset)
        self.descriptionLabel.alpha = 1 - offset
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        self.screenshotImageView.transform = CGAffineTransformMakeRotation(-offset * CGFloat(M_PI))
        self.descriptionLabel.transform = CGAffineTransformMakeTranslation(offset * self.view.width, offset * self.view.height)
    }

}
