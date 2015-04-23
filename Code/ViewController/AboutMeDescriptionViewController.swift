//
//  AboutMeDescriptionViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/19/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class AboutMeDescriptionViewController: BaseChildViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        configureDescriptionLabel()
    }
    
    // MARK: - Configure
    
    func configureDescriptionLabel() {
        self.descriptionLabel.textColor = self.defaultTextColor
        self.descriptionLabel.textAlignment = .Center
        self.descriptionLabel.font = UIFont.font(EKFontType.LightItalic, fontSize: 19)
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.text = "I am a 19-year-old student of computer science in my senior year at the University Of California, Davis. As an iOS developer both by career choice and hobby, I constantly enjoy tinkering, learning, and stretching the limits of my abilities. My passion for mobile development lies at the intersection of my love for distinguished design and quality code. For me, excellence comes from achieving what I never thought I could achieve."
    }
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        self.descriptionLabel.transform = CGAffineTransformMakeScale(1 - offset, 1 - offset)
    }

    override func onScrollWithPageOnLeft(offset: CGFloat) {
        self.descriptionLabel.transform = CGAffineTransformMakeTranslation(offset * self.view.width, offset * self.view.height)
    }

}
