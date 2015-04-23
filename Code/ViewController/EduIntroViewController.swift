//
//  EduIntroViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class EduIntroViewController: BaseChildViewController {

    @IBOutlet var plainLabels: [UILabel]!
    @IBOutlet var largeLabels: [UILabel]!
    @IBOutlet var boldViews: [UIView]!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurePlainLabels()
        configureLargeLabels()
    }


    // MARK: - Configure
    
    func configurePlainLabels() {
        for label in self.plainLabels {
            label.textColor = self.defaultTextColor
            label.font = UIFont.font(EKFontType.LightItalic, fontSize: 20)
            label.textAlignment = .Center
        }
    }
    
    func configureLargeLabels() {
        for label in self.largeLabels {
            label.textColor = self.defaultTextColor
            label.font = UIFont.font(EKFontType.Bold, fontSize: 25)
            label.textAlignment = .Center
        }
    }
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        for view in self.boldViews {
            view.transform = CGAffineTransformMakeTranslation(self.view.width * offset, 0)
            view.alpha = 1 - offset
        }
    }
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        
    }
}
