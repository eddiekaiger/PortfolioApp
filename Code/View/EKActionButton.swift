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
    
    func setup() {
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 2
        self.titleLabel!.textAlignment = .Center
        self.titleLabel!.font = UIFont.font(EKFontType.Light, fontSize: 20)
    }
    
}
