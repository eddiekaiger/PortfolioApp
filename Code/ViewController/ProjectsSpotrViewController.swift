//
//  ProjectsSpotrViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class ProjectsSpotrViewController: BaseChildViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureDescriptionLabel()
        configureLogoImageView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.logoImageView.layer.cornerRadius = self.logoImageView.height / 2.0
    }
    
    // MARK: - Configure
    
    private func configureDescriptionLabel() {
        self.descriptionLabel.text = "Spotr is an app that makes use of a notification center widget so that you never again forget where you left something. Spotr is still under development."
        self.descriptionLabel.textColor = self.defaultTextColor
        self.descriptionLabel.textAlignment = .Center
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.font(EKFontType.Light, fontSize: 20)
    }
    
    private func configureLogoImageView() {
        self.logoImageView.layer.borderColor = UIColor.whiteColor().CGColor
        self.logoImageView.layer.borderWidth = 4
        self.logoImageView.layer.masksToBounds = true
    }
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        self.logoImageView.transform = CGAffineTransformMakeRotation(-offset * CGFloat(M_PI))
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        self.logoImageView.transform = CGAffineTransformTranslate(CGAffineTransformMakeRotation(offset * CGFloat(M_PI)),
            offset * self.view.width, -offset * self.view.height)
        self.descriptionLabel.transform = CGAffineTransformMakeTranslation(self.view.width * offset, self.view.height * -offset)
    }
}
