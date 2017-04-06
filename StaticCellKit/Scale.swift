//
//  Scale.swift
//  StaticCellKit
//
//  Created by Mango on 2017/4/6.
//  Copyright © 2017年 MangoMade. All rights reserved.
//

import UIKit

struct Scale {
    
    static func width(width: CGFloat) -> CGFloat {
        return width * Screen.width / 375.0
    }
    
    static func height(height: CGFloat) -> CGFloat {
        return height * Screen.height / 667.0
    }
    
    static func selectHeight(iPhone4: CGFloat, iPhone5: CGFloat, iPhone6: CGFloat, iPhone6Plus: CGFloat) -> CGFloat {
        switch Screen.height {
        case 480.0:
            return iPhone4
        case 568.0:
            return iPhone5
        case 667.0:
            return iPhone6
        case 736.0:
            return iPhone6Plus
        default:
            return iPhone6
        }
    }
}
