//
//  UIColor+Extension.swift
//  myTodayNews
//
//  Created by yongzhen on 2018/9/9.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

extension UIColor{
    
   convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
    // ios 10 的方法
//        self.init(displayP3Red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    
    self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    
    }
    
   class func myBackgroudColor() -> UIColor {
        return UIColor(r: 248, g: 249, b: 247)
    }
}
