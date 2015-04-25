//
//  EduCourseworkViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/20/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class EduCourseworkViewController: BaseChildViewController, UITableViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let rowHeight: CGFloat = 60
    
    let courses =
        ["Data Structures",
        "Algorithm Design",
        "Parallel Programming",
        "Databases",
        "Graphics",
        "Operating Systems"]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureTitleLabel()
        configureTableView()
    }
    
    // MARK: - Configure
    
    func configureTitleLabel() {
        self.titleLabel.text = "Relevant Courses:"
        self.titleLabel.textColor = self.defaultTextColor
        self.titleLabel.textAlignment = .Center
        self.titleLabel.font = UIFont.font(EKFontType.Bold, fontSize: 25)
    }
    
    func configureTableView() {
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: "EKItemTableViewCell", bundle: nil), forCellReuseIdentifier: EKItemTableViewCell.kCellIdentifier)
        self.tableView.rowHeight = self.rowHeight
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.userInteractionEnabled = false
    }
    
    // MARK: - UITableView Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(EKItemTableViewCell.kCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = self.courses[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courses.count
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
    
}
