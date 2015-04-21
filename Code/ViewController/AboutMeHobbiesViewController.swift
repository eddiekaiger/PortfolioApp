//
//  AboutMeHobbiesViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/19/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class AboutMeHobbiesViewController: BaseChildViewController, UITableViewDataSource {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleTableViewSpace: NSLayoutConstraint!
    @IBOutlet weak var titleButtonSpace: NSLayoutConstraint!
    
    let rowHeight: CGFloat = 70
    
    let hobbies = ["Playing guitar", "Drinking good cofee", "Snowboarding", "Jogging", "Biking"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTitleLabel()
        configureTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if self.dismissButtonOffset + self.titleLabel.height + self.titleTableViewSpace.constant +
            self.titleButtonSpace.constant + (CGFloat(self.hobbies.count) * rowHeight) > self.view.height {
                self.titleButtonSpace.constant = self.dismissButtonOffset
                self.titleTableViewSpace.constant = 10
        }
    }
    
    // MARK: - Configure
    
    func configureTitleLabel() {
        self.titleLabel.text = "Other than programming, some of my other hobbies and interests include:"
        self.titleLabel.textColor = UIColor.whiteColor()
        self.titleLabel.font = UIFont.font(EKFontType.Light, fontSize: 20)
        self.titleLabel.textAlignment = .Center
        self.titleLabel.numberOfLines = 0
    }
    
    func configureTableView() {
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: "AboutMeHobbiesTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutMeHobbiesCell")
        self.tableView.rowHeight = self.rowHeight
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.userInteractionEnabled = false
    }
    
    // MARK: - EKScrollingDelegate 
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        
        self.titleLabel.transform = CGAffineTransformMakeTranslation(-offset * self.view.width, -offset/2 * self.view.height)

        // Animate each cell in an offset fashion
        for i in 0..<self.hobbies.count {
            let cell = self.tableView.visibleCells()[i] as! UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(CGFloat(i) * offset * 150, 0)
        }
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        
        self.titleLabel.alpha = 1 - offset
        
        // Animate each cell in an offset fashion
        for i in 0..<self.hobbies.count {
            let cell = self.tableView.visibleCells()[i] as! UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(CGFloat(i) * offset * -150, 0)
        }
    }

    
    // MARK: - UITableView Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("AboutMeHobbiesCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
//        cell.contentView.backgroundColor = UIColor(white: 1, alpha: 0.2)
        cell.selectionStyle = .None
        
        cell.textLabel!.textColor = UIColor.whiteColor()
        cell.textLabel!.text = self.hobbies[indexPath.row]
        cell.textLabel!.font = UIFont.font(EKFontType.Light, fontSize: 20)
        cell.textLabel!.textAlignment = .Center
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hobbies.count
    }
}
