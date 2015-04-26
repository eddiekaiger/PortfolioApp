//
//  ProjectsLeapFrogViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class ProjectsLeapFrogViewController: BaseChildViewController {

    @IBOutlet weak var mysteryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureDescriptionLabel()
    }
    
    // MARK: - Configure

    func configureDescriptionLabel() {
        self.descriptionLabel.text = "A friend and I have been working on a large project for the past few months, codenamed Project Leapfrog, the biggest app I've ever built. It's a peer-to-peer platform targeted towards college towns, built with Objective-C & Swift with a backend built on Firebase, Node.js, and MongoDB. Project Leapfrog will be released this summer."
        self.descriptionLabel.textColor = self.defaultTextColor
        self.descriptionLabel.textAlignment = .Center
        self.descriptionLabel.font = UIFont.font(EKFontType.Light, fontSize: 17)
        self.descriptionLabel.numberOfLines = 0
    }
    
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        let translateTransform = CGAffineTransformScale(CGAffineTransformMakeTranslation(-offset * self.view.width, 0), 1-offset, 1-offset)
        self.mysteryImageView.transform = translateTransform
        self.descriptionLabel.transform = translateTransform
        self.mysteryImageView.alpha = 1 - offset
        self.descriptionLabel.alpha = 1 - offset
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        
    }

}
