//
//  ContactViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: BaseChildViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet var buttons: [EKActionButton]!
    
    // MARK: - Actions
    
    @IBAction private func email(sender: AnyObject) {
        if MFMailComposeViewController.canSendMail() {
            var mailController = MFMailComposeViewController()
            mailController.mailComposeDelegate = self
            mailController.setToRecipients(["eddiekaiger@gmail.com"])
            self.presentViewController(mailController, animated: true, completion: nil)
        }
    }
    
    @IBAction private func goToGithub(sender: AnyObject) {
        self.goToLink("https://github.com/eddiekaiger")
    }
    
    @IBAction private func goToWebsite(sender: AnyObject) {
        self.goToLink("http://www.eddiekaiger.com")
    }
    
    @IBAction private func goToFacebook(sender: AnyObject) {
        self.goToLink("https://www.facebook.com/eddie.kaiger")
    }
    
    @IBAction private func goToLinkedIn(sender: AnyObject) {
        self.goToLink("https://www.linkedin.com/in/eddiekaiger")
    }
    
    // MARK: - MFMailComposeViewControllerDelegate
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        for i in 0..<self.buttons.count {
            var button = self.buttons[i]
            button.transform = CGAffineTransformMakeRotation(offset * CGFloat(i) * 0.4)
        }
    }
}
