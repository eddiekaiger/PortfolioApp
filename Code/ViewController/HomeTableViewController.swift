//
//  HomeTableViewManager.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/16/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import Foundation
import UIKit

/* Delegate and data source for HomeViewController's tableview */

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    var normalCellColor: UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    }
    
    var highlightedCellColor: UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
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
        cell.layoutMargins = UIEdgeInsetsZero
        
        var selectedView = UIView()
        selectedView.backgroundColor = self.highlightedCellColor
        cell.selectedBackgroundView = selectedView
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Deselect cell
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var type: PortfolioType = PortfolioType(rawValue: indexPath.row)!
        
        // Present VC
        var containerVC: RootContainerViewController = self.storyboard!.instantiateViewControllerWithIdentifier("RootContainerVC") as! RootContainerViewController
        self.presentViewController(containerVC, animated: true, completion: nil)
        
//        switch type {
//        case .About:
//            
//        case .Education:
//            
//        case .Projects:
//            
//        case .Experience:
//            
//        case .Contact:
//            
//        }
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (self.tableView.frame.size.height - self.defaultHeaderHeight) / 5
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}