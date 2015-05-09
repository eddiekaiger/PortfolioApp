//
//  ExpTruliaViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class ExpTruliaViewController: BaseChildViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureTitleLabel()
        configureSubtitleLabel()
        configureDescriptionLabel()
        configureImageView()
    }
    
    // MARK: - Configure
    
    private func configureImageView() {
        self.logoImageView.layer.cornerRadius = self.logoImageView.height / 2.0
        self.logoImageView.layer.masksToBounds = true
    }
    
    private func configureTitleLabel() {
        self.titleLabel.text = "iOS Developer Intern - Trulia"
        self.titleLabel.textColor = self.defaultTextColor
        self.titleLabel.textAlignment = .Center
        self.titleLabel.font = UIFont.font(EKFontType.Bold, fontSize: 20)
    }
    
    private func configureSubtitleLabel() {
        self.subtitleLabel.text = "Summer 2014"
        self.subtitleLabel.textColor = self.defaultTextColor
        self.subtitleLabel.textAlignment = .Center
        self.subtitleLabel.font = UIFont.font(EKFontType.LightItalic, fontSize: 20)
    }
    
    private func configureDescriptionLabel() {
        self.descriptionLabel.text = "Worked as a full-time summer intern, developing for Trulia's consumer iPhone and iPad applications. Worked with Objective-C, XCode, git, JIRA, PHP. Created a rentals feature and fixed bugs for the release of iOS 8."
        self.descriptionLabel.textColor = self.defaultTextColor
        self.descriptionLabel.textAlignment = .Center
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.font(EKFontType.Normal, fontSize: 17)
    }
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        self.titleLabel.transform = CGAffineTransformMakeTranslation(0, -offset * 200)
        self.subtitleLabel.transform = CGAffineTransformMakeTranslation(0, -offset * 100)
        self.descriptionLabel.transform = CGAffineTransformMakeTranslation(0, offset * 200)
    }
}
