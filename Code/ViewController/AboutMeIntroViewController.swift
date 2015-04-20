//
//  AboutMeIntroViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/18/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class AboutMeIntroViewController: BaseChildViewController {

    @IBOutlet weak var nameHeaderLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var mottoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNameHeaderLabel()
        configureNameLabel()
        configureProfileImageView()
        configureDescriptionLabel()
    }
    
    // MARK: - Configure
    
    private func configureNameHeaderLabel() {
        self.nameHeaderLabel.text = "My name is"
        self.nameHeaderLabel.textColor = self.defaultTextColor
        self.nameHeaderLabel.textAlignment = .Center
        self.nameHeaderLabel.font = UIFont.font(EKFontType.Light, fontSize: 20)
    }
    
    private func configureNameLabel() {
        self.nameLabel.text = "Eddie Kaiger"
        self.nameLabel.textColor = self.defaultTextColor
        self.nameLabel.textAlignment = .Center
        self.nameLabel.font = UIFont.font(EKFontType.Light, fontSize: 30)
    }
    
    private func configureProfileImageView() {
        self.profileImageView.image = UIImage(named: "Profile-Pic")
        self.profileImageView.layer.cornerRadius = self.profileImageView.height / 2
    }
    
    private func configureDescriptionLabel() {
        self.mottoLabel.text = "Developer - Thinker - Creator"
        self.mottoLabel.textColor = self.defaultTextColor
        self.mottoLabel.numberOfLines = 0
        self.mottoLabel.textAlignment = .Center
        self.mottoLabel.font = UIFont.font(EKFontType.Light, fontSize: 16)
    }
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        self.nameHeaderLabel.transform = CGAffineTransformMakeTranslation(0, -(self.view.height * 0.5 * offset))
        self.nameLabel.transform = CGAffineTransformMakeTranslation(0, -(self.view.height * 0.3 * offset))
        self.profileImageView.transform = CGAffineTransformMakeScale(1 + offset, 1 + offset)
        self.profileImageView.alpha = 1 - offset
        self.mottoLabel.transform = CGAffineTransformMakeTranslation(0, self.view.height * 0.3 * offset)
    }
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        let newAlpha = 1 - offset
        self.nameHeaderLabel.alpha = newAlpha
        self.nameLabel.alpha = newAlpha
        self.profileImageView.alpha = newAlpha
        self.mottoLabel.alpha = newAlpha
    }

}
