//
//  AboutAppViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class AboutAppViewController: BaseChildViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureTitleLabel()
        configureDescriptionLabel()
    }
    
    // MARK: - Configure
    
    private func configureTitleLabel() {
        self.titleLabel.text = "About This App"
        self.titleLabel.textColor = self.defaultTextColor
        self.titleLabel.textAlignment = .Center
        self.titleLabel.font = UIFont.font(EKFontType.Bold, fontSize: 20)
    }
    
    private func configureDescriptionLabel() {
        self.descriptionLabel.text = "All code in this app was written by me. All images used as backgrounds are my own. Finally, this was a very enjoyable experience!"
        self.descriptionLabel.textColor = self.defaultTextColor
        self.descriptionLabel.textAlignment = .Center
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.font(EKFontType.Normal, fontSize: 18)
    }
}
