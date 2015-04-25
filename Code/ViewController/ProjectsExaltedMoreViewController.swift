//
//  ProjectsExaltedMoreViewController.swift
//  Eddie Kaiger
//
//  Created by Eddie Kaiger on 4/24/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class ProjectsExaltedMoreViewController: BaseChildViewController {

    
    @IBOutlet weak var testimonialLabel: UILabel!
    @IBOutlet var buttons: [EKActionButton]!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureTestimonialLabel()
    }
    
    // MARK: - Configure
    
    func configureTestimonialLabel() {
        
        var attrString = NSMutableAttributedString(
            string: "\"This app is a lifechanger... I've waited long enough for an app with these capabilities.\"\n\n",
            attributes: [NSFontAttributeName: UIFont.font(EKFontType.LightItalic, fontSize: 20)])
        attrString.appendAttributedString(NSAttributedString(
            string: "- An iPhone User",
            attributes: [NSFontAttributeName: UIFont.font(EKFontType.Normal, fontSize: 18)]))
        
        
        self.testimonialLabel.attributedText = attrString
        self.testimonialLabel.textColor = self.defaultTextColor
        self.testimonialLabel.textAlignment = .Center
        self.testimonialLabel.numberOfLines = 0
    }
    
    // MARK: - Actions
    
    @IBAction func goToiPhoneLink(sender: AnyObject) {
        self.goToLink("http://goo.gl/8qU0Lv")
    }
    
    
    @IBAction func goToiPadLink(sender: AnyObject) {
        self.goToLink("http://goo.gl/97nWnO")
    }
    
    @IBAction func goToAndroidLink(sender: AnyObject) {
        self.goToLink("http://goo.gl/QK1lvz")
    }
    
    func goToLink(urlString: String) {
        UIApplication.sharedApplication().openURL(NSURL(string: urlString)!)
    }
    
    // EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        self.testimonialLabel.transform = CGAffineTransformMakeScale(1 - offset, 1 - offset)
        for i in 0..<self.buttons.count {
            var button = self.buttons[i]
            button.transform = CGAffineTransformMakeTranslation(CGFloat(i) * offset * 200, 0)
        }
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        self.testimonialLabel.transform = CGAffineTransformMakeScale(1 - offset, 1 - offset)
        for i in 0..<self.buttons.count {
            var button = self.buttons[i]
            button.transform = CGAffineTransformMakeTranslation(CGFloat(i) * offset * -200, 0)
        }
    }

}
