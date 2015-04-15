//
//  MainViewController.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/14/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!

    let defaultHeaderHeight: CGFloat = 250
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        configureTableView()
        
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
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    // MARK: UITableView Delegate & Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(PortfolioTableViewCell.cellIdentifer, forIndexPath: indexPath) as! PortfolioTableViewCell
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        self.headerHeightConstraint.constant = -scrollView.contentOffset.y;
        
        NSLog("Content offset: %.2f", scrollView.contentOffset.y)
    }
}
