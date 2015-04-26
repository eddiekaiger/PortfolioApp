//
//  ProjectsWeeblogViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class ProjectsWeeblogViewController: BaseChildViewController {

    
    @IBOutlet weak var screenshotImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureScreenshot()
        configureDescriptionLabel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.screenshotImageView.layer.shadowPath = UIBezierPath(rect: self.screenshotImageView.bounds).CGPath
    }
    
    // MARK: - Configure
    
    func configureScreenshot() {
        self.screenshotImageView.layer.shadowColor = UIColor.blackColor().CGColor
        self.screenshotImageView.layer.shadowOpacity = 0.8
        self.screenshotImageView.layer.shadowOffset = CGSizeMake(2, 2)
    }
    
    func configureDescriptionLabel() {
        self.descriptionLabel.text = "Weeblog was an internship interview project for Weebly that I made over the course of a few weeks. The app is a fully-featured local blog built on Core Data, containing photo, video, and rich text support. (Oh, and I got the internship.)"
        self.descriptionLabel.textColor = self.defaultTextColor
        self.descriptionLabel.textAlignment = .Center
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.font(EKFontType.Light, fontSize: 16)
    }
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        self.screenshotImageView.transform = CGAffineTransformMakeScale(1 - offset, 1 - offset)
        self.descriptionLabel.alpha = 1 - offset
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        self.screenshotImageView.transform = CGAffineTransformMakeTranslation(offset * self.view.width, -offset * self.view.height)
        self.descriptionLabel.transform = CGAffineTransformMakeTranslation(offset * self.view.width, offset * self.view.height)
    }


}
