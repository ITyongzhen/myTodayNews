//
//  MyTheme.swift
//  myTodayNews
//
//  Created by yongzhen on 2018/9/16.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit
import SwiftTheme

enum MyTheme: Int {
    case day = 0
    case night = 1
    
    static var before = MyTheme.day
    static var current = MyTheme.day
    
    /// 选择主题
    static func switchTo(_ theme: MyTheme) {
        before = current
        current = theme
        switch theme {
        case .day: ThemeManager.setTheme(plistName: "default_theme", path: .mainBundle)
        case .night: ThemeManager.setTheme(plistName: "night_theme", path: .mainBundle)
        }
    }
    
    /// 选择了夜间
    static func switchNight(_ isToNight: Bool) {
        switchTo(isToNight ? .night: .day)
    }
    
    /// 判断当前是否夜间模式
    static func isNight() -> Bool{
        return current == .night
    }
}
