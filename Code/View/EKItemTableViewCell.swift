//
//  EKItemTableViewCell.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/24/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class EKItemTableViewCell: UITableViewCell {

    static let kCellIdentifier = "EKItemCell"
    
    override func awakeFromNib() {

        super.awakeFromNib()
        
        configureCell()
    }

    // MARK: - Configure
    
    func configureCell() {
        
        self.backgroundColor = UIColor.clearColor()
        self.selectionStyle = .None
        
        self.textLabel!.textColor = UIColor.whiteColor()
        self.textLabel!.font = UIFont.font(EKFontType.Light, fontSize: 20)
        self.textLabel!.textAlignment = .Center
    }
    
}
