//
//  ExpSkillsViewController.swift
//  Eddie Kaiger
//
//  Created by Eddie Kaiger on 4/25/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit

class ExpSkillsViewController: BaseChildViewController, UITableViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let skills = ["Objective-C", "Swift", "C/C++", "Java", "PHP", "JavaScript", "MySQL", "Python", "HTML/CSS", "JSON", "XCode", "Sublime Text", "Android Studio", "Adobe Illustrator", "Sketch"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureTitleLabel()
        configureTableView()
    }
    
    // MARK: - Configure
    
    private func configureTitleLabel() {
        self.titleLabel.text = "I've had experience with the following languages and tools:"
        self.titleLabel.textAlignment = .Center
        self.titleLabel.textColor = self.defaultTextColor
        self.titleLabel.numberOfLines = 0
        self.titleLabel.font = UIFont.font(EKFontType.Bold, fontSize: 20)
    }
    
    private func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.indicatorStyle = UIScrollViewIndicatorStyle.White
        self.tableView.registerNib(UINib(nibName: "EKItemTableViewCell", bundle: nil), forCellReuseIdentifier: EKItemTableViewCell.kCellIdentifier)
        self.tableView.rowHeight = 60
    }
    
    // MARK: - UITableView Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(EKItemTableViewCell.kCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = self.skills[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.skills.count
    }
    
    // MARK: - EKScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        self.titleLabel.transform = CGAffineTransformMakeTranslation(self.view.width * offset, self.view.height * -offset)
        // Animate each cell in an offset fashion
        for i in 0..<self.skills.count {
            let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: i, inSection: 0))
            cell?.transform = CGAffineTransformMakeTranslation(CGFloat(i) * offset * 50, 0)
        }
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        let newAlpha = 1 - (offset*3)
        self.titleLabel.alpha = newAlpha
        self.tableView.alpha = newAlpha
    }
}
