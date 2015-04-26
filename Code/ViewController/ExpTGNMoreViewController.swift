//
//  ExpTGNMoreViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class ExpTGNMoreViewController: BaseChildViewController {

    @IBOutlet var buttons: [UIView]!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureDescriptionLabel()
    }
    
    // MARK: - Configure
    
    func configureDescriptionLabel() {
        self.descriptionLabel.text = "GraceCity is now expanding to every county in California."
        self.descriptionLabel.textAlignment = .Center
        self.descriptionLabel.textColor = self.defaultTextColor
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.font(EKFontType.LightItalic, fontSize: 20)
    }
    
    // MARK: - Actions
    
    @IBAction func downloadiOS(sender: AnyObject) {
        self.goToLink("https://itunes.apple.com/us/app/gracecity/id895315841?mt=8")
    }
    
    @IBAction func downloadAndroid(sender: AnyObject) {
        self.goToLink("https://play.google.com/store/apps/details?id=com.thegracenetwork.gc")
    }
    
    func goToLink(urlString: String) {
        UIApplication.sharedApplication().openURL(NSURL(string: urlString)!)
    }
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        var i:CGFloat = 0
        for view in self.buttons + [self.descriptionLabel]  {
            view.transform = CGAffineTransformMakeTranslation(offset * i++ * 250, 0)
        }
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        for view in self.buttons {
            view.transform = CGAffineTransformMakeTranslation(offset * self.view.width, -offset * self.view.height)
        }
        
        self.descriptionLabel.transform = CGAffineTransformMakeTranslation(offset * self.view.width, offset * self.view.height)
    }

}
