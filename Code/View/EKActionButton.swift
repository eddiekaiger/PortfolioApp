//
//  EKActionButton.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/24/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class EKActionButton: UIButton {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 2
        self.titleLabel!.textAlignment = .Center
        self.titleLabel!.font = UIFont.font(EKFontType.Light, fontSize: 20)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.backgroundColor = UIColor(white: 1, alpha: 0.1)
    }
    
    override var highlighted: Bool {
        didSet {
            if (highlighted) {
                self.layer.borderColor = UIColor.lightGrayColor().CGColor
            } else {
                self.layer.borderColor = UIColor.whiteColor().CGColor
            }
        }
    }
}
