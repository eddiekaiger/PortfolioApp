//
//  HomeTableViewManager.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/16/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    var normalCellColor: UIColor {
        return UIColor(red: 1, green: 1, blue: 1, alpha: 0.05)
    }
    
    var highlightedCellColor: UIColor {
        return UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
    }
    
    enum PortfolioType: Int {
        case About = 0
        case Education = 1
        case Projects = 2
        case Experience = 3
        case Contact = 4
    }
    
    // MARK: Getters
    
    func stringForPortfolioType(var type: PortfolioType) -> String {
        
        switch type {
        case .About:
            return "About Me"
        case .Education:
            return "Education"
        case .Projects:
            return "Projects"
        case .Experience:
            return "Experience"
        case .Contact:
            return "Contact"
        }
    }
    
    // MARK: Delegate & Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: PortfolioTableViewCell = tableView.dequeueReusableCellWithIdentifier(PortfolioTableViewCell.cellIdentifer, forIndexPath: indexPath) as! PortfolioTableViewCell
        
        cell.textLabel?.text = stringForPortfolioType(PortfolioType(rawValue: indexPath.row)!).uppercaseString
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont.font(EKFontType.Light, fontSize: 18)
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.backgroundColor = self.normalCellColor
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.backgroundColor = self.highlightedCellColor
    }
    
    func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.backgroundColor = self.normalCellColor
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (self.tableView.frame.size.height - self.defaultHeaderHeight) / 5
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}