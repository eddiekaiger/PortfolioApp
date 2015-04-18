//
//  EKPageScrolling.swift
//  Portfolio
//
//  Created by Eddie Kaiger on 4/17/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

import Foundation
import UIKit

protocol EKPageScrolling {
    
    /**
    Update view when a fraction of it is on the left.
    @param offset Must be a value between 0 and 1 (0 meaning page is fully visible, 1 meaning page is completely to the left of the visible page)
    */
    func onScrollWithPageOnLeft(offset: CGFloat);
    
    /**
    Update view when a fraction of it is on the right page currently visible.
    @param offset Must be a value between 0 and 1 (0 meaning page is fully visible, 1 meaning page is completely to the right of the visible page)
    */
    func onScrollWithPageOnRight(offset: CGFloat);
}
