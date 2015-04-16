//
//  EKFont.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/16/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import Foundation
import UIKit

enum EKFontType {
    case Light
    case Normal
    case Bold
}

extension UIFont {
    
    class func font(type: EKFontType, fontSize size: CGFloat) -> UIFont! {
        
        var fontString = ""
        
        switch type {
        case .Light:
            fontString = "Light"
        case .Normal:
            fontString = "Book"
        case .Bold:
            fontString = "Heavy"
        default:
            fontString = "Book"
        }
        
        return UIFont(name: String(format: "Avenir-%@", fontString), size: size)
    }
    
}