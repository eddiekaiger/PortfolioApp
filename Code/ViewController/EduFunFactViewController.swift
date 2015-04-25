//
//  EduFunFactViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class EduFunFactViewController: BaseChildViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {

        super.viewDidLoad()

        configureTitleLabel()
        configureDescriptionLabel()
    }
    
    // MARK: - Configure
    
    func configureTitleLabel() {
        self.titleLabel.text = "Fun Fact:"
        self.titleLabel.textColor = self.defaultTextColor
        self.titleLabel.textAlignment = .Center
        self.titleLabel.font = UIFont.font(EKFontType.Bold, fontSize: 35)
    }
    
    func configureDescriptionLabel() {
        self.descriptionLabel.text = "I tested out of high school and graduated two years early, eager to begin taking computer science courses in college."
        self.descriptionLabel.textColor = self.defaultTextColor
        self.descriptionLabel.textAlignment = .Center
        self.descriptionLabel.font = UIFont.font(EKFontType.Light, fontSize: 20)
        self.descriptionLabel.numberOfLines = 0
    }

    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        let vertTranslate: CGFloat = 200.0
        self.titleLabel.transform = CGAffineTransformMakeTranslation(0, -offset * vertTranslate)
        self.descriptionLabel.transform = CGAffineTransformMakeTranslation(0, offset * vertTranslate)
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        
    }

}
