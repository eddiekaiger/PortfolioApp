//
//  ExpTGNIntroViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class ExpTGNIntroViewController: BaseChildViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureTitleLabel()
        configureSubtitleLabel()
        configureDescriptionLabel()
    }
    
    // MARK: - Configure
    
    private func configureTitleLabel() {
        self.titleLabel.text = "Software Developer - TGN"
        self.titleLabel.textColor = self.defaultTextColor
        self.titleLabel.textAlignment = .Center
        self.titleLabel.font = UIFont.font(EKFontType.Bold, fontSize: 20)
    }
    
    private func configureSubtitleLabel() {
        self.subtitleLabel.text = "February 2014 - Present"
        self.subtitleLabel.textColor = self.defaultTextColor
        self.subtitleLabel.textAlignment = .Center
        self.subtitleLabel.font = UIFont.font(EKFontType.LightItalic, fontSize: 20)
    }
    
    private func configureDescriptionLabel() {
        self.descriptionLabel.text = "I volunteer on a part-time basis with an anti-human-trafficking organization called The Grace Network. Designed and developed a county-based application that serves the needs of first responders (social workers, police officers, etc). Also created a web form where agencies across California can register into our app database. Used Objective-C, Java, XML, PHP, MySQL, JavaScript, JQuery, HTML, CSS."
        self.descriptionLabel.textColor = self.defaultTextColor
        self.descriptionLabel.textAlignment = .Center
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.font(EKFontType.Normal, fontSize: 16)
    }
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        for view in [self.titleLabel, self.subtitleLabel, self.logoImageView, self.descriptionLabel] {
            view.transform = CGAffineTransformMakeScale(1-offset, 1-offset)
        }
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        for view in [self.titleLabel, self.subtitleLabel, self.logoImageView, self.descriptionLabel] {
            view.transform = CGAffineTransformMakeTranslation(offset * self.view.width, 0)
            view.alpha = 1 - (offset * 2)
        }
    }
}
