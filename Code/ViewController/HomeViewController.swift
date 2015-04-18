//
//  MainViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/14/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var appleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var mottoLabel: UILabel!
    
    var defaultHeaderHeight: CGFloat { return self.view.frame.size.height * 0.4 }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        configureTableView()
        configureAppleLabel()
        configurePersonalLabels()
        
        self.headerHeightConstraint.constant = defaultHeaderHeight
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    // MARK: Configure
    
    func configureTableView() {
        
        self.tableView.contentInset = UIEdgeInsetsMake(defaultHeaderHeight, 0, 0, 0)
        self.tableView.tableFooterView = UIView()
        self.tableView.registerClass(PortfolioTableViewCell.self, forCellReuseIdentifier: PortfolioTableViewCell.cellIdentifer)
        self.tableView.separatorColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        self.tableView.separatorInset = UIEdgeInsetsZero
        self.tableView.layoutMargins = UIEdgeInsetsZero
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func configureAppleLabel() {
        
        self.appleLabel.text = "I \u{2665} Apple";
        self.appleLabel.textColor = UIColor.whiteColor()
        self.appleLabel.font = UIFont.font(EKFontType.Normal, fontSize: 16)
        self.appleLabel.alpha = 0
    }
    
    func configurePersonalLabels() {
        
        // Name label
        self.nameLabel.text = "Eddie Kaiger"
        self.nameLabel.font = UIFont.font(EKFontType.Light, fontSize: 30)
        self.nameLabel.textAlignment = NSTextAlignment.Center
        self.nameLabel.textColor = UIColor.whiteColor()
        
        // Motto label
        self.mottoLabel.text = "Developer - Thinker - Creator"
        self.mottoLabel.font = UIFont.font(EKFontType.Light, fontSize: 15)
        self.mottoLabel.textAlignment = NSTextAlignment.Center
        self.mottoLabel.textColor = UIColor.whiteColor()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        
        // Adjust height of header view
        self.headerHeightConstraint.constant = -offsetY
        
        // When we scroll up, adjust opacity of header view items
        if -offsetY < self.defaultHeaderHeight {
            
            // Point of full invisibility
            let invisiblePoint = self.defaultHeaderHeight - 150

            // Calculated alpha
            let newAlpha = (-offsetY - invisiblePoint) / 100
            let labelAlphaOffset: CGFloat = 0.5

            self.nameLabel.alpha = newAlpha - labelAlphaOffset
            self.profileImageView.alpha = newAlpha
            self.mottoLabel.alpha = newAlpha - labelAlphaOffset
            
            // Invert alpha of apple label
            self.appleLabel.alpha = 1 - newAlpha - labelAlphaOffset
        }
    }
}
