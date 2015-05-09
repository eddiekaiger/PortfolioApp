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
    
    var rowHeight: CGFloat = 70
    
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
        
        if rowHeight * CGFloat(self.hobbies.count) + self.titleLabel.height + self.titleLabel.top > self.view.height {
            self.tableView.rowHeight = 50
        }
    }
    
    // MARK: - Configure
    
    private func configureTitleLabel() {
        self.titleLabel.text = "Other than programming, some of my other hobbies and interests include:"
        self.titleLabel.textColor = UIColor.whiteColor()
        self.titleLabel.font = UIFont.font(EKFontType.Light, fontSize: 20)
        self.titleLabel.textAlignment = .Center
        self.titleLabel.numberOfLines = 0
    }
    
    private func configureTableView() {
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: "EKItemTableViewCell", bundle: nil), forCellReuseIdentifier: EKItemTableViewCell.kCellIdentifier)
        self.tableView.rowHeight = self.rowHeight
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.userInteractionEnabled = false
    }
    
    // MARK: - EKScrollingDelegate 
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        
        self.titleLabel.transform = CGAffineTransformMakeTranslation(-offset * self.view.width, -offset/2 * self.view.height)

        // Animate each cell in an offset fashion
        for i in 0..<self.tableView.visibleCells().count {
            let cell = self.tableView.visibleCells()[i] as! UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(CGFloat(i) * offset * 150, 0)
        }
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        
        self.titleLabel.alpha = 1 - offset
        
        // Animate each cell in an offset fashion
        for i in 0..<self.tableView.visibleCells().count {
            let cell = self.tableView.visibleCells()[i] as! UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(CGFloat(i) * offset * -150, 0)
        }
    }

    
    // MARK: - UITableView Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(EKItemTableViewCell.kCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = self.hobbies[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hobbies.count
    }
}
