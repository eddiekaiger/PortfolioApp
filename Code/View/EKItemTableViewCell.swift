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
    
    @IBOutlet weak var labelView: UIView!
    
    override func awakeFromNib() {

        super.awakeFromNib()
        
        configureCell()
    }

    // MARK: - Configure
    
    func configureCell() {
        
        self.labelView.backgroundColor = UIColor(white: 1, alpha: 0.2)
        
        self.backgroundColor = UIColor.clearColor()
        self.selectionStyle = .None
        
        self.textLabel!.textColor = UIColor.whiteColor()
        self.textLabel!.font = UIFont.font(EKFontType.Light, fontSize: 20)
        self.textLabel!.textAlignment = .Center
    }
    
}
