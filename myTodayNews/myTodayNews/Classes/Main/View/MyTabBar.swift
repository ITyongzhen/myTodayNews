//
//  MyTabBar.swift
//  myTodayNews
//
//  Created by yongzhen on 2018/9/8.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

class MyTabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(publishButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  private  lazy var publishButton: UIButton = {
       let publicButton = UIButton(type: .custom)
        publicButton.setImage(UIImage(named: "feed_publish_44x44_"), for: .normal)
        publicButton.setImage(UIImage(named: "feed_publish_press_44x44_"), for: .selected)
        return publicButton
    }()
    
    override func layoutSubviews() {
            super.layoutSubviews()
        // 当前tabbar 宽度，高度
        let width = frame.width
        let height = frame.height
     
        // button 宽度高度
        let buttonW: CGFloat = width * 0.2
        let buttonH: CGFloat = height
        let buttonY: CGFloat = 0
        
        publishButton.frame  = CGRect(x: buttonW * 2, y: buttonY - 7, width: buttonW, height: buttonH)
        var index: Int = 0
        for button in subviews {
            print(button)
            if  button.isKind(of: NSClassFromString("UITabBarButton")!){
                let buttonX = buttonW * (CGFloat)(index > 1 ? (index + 1):index)
                button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
                index += 1
            }
        }
        
        
    }
}
