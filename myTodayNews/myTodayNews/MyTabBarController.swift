//
//  MyTabBarController.swift
//  myTodayNews
//
//  Created by yongzhen on 2018/9/8.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = UIColor(red: 245/255.0, green: 93/255.0, blue: 90/255.0, alpha: 1)
        
        addChildViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    
    func addChildViewControllers(){
        setChildViewController(HomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectedImageName: "home_tabbar_press_32x32_")
         setChildViewController(VideoViewController(), title: "视频", imageName: "video_tabbar_32x32_", selectedImageName: "video_tabbar_press_night_32x32_")
         setChildViewController(HuoshanViewController(), title: "小视频", imageName: "huoshan_tabbar_32x32_", selectedImageName: "huoshan_tabbar_press_32x32_")
         setChildViewController(MineViewController(), title: "我的", imageName: "mine_tabbar_32x32_", selectedImageName: "mine_tabbar_press_32x32_")
    }
    
    // 初始化子控制器
    func setChildViewController(_ childController: UIViewController,title: String, imageName: String, selectedImageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        childController.title = title
         // 添加导航控制器为 TabBarController 的子控制器
        let navVC = MyNavigationController(rootViewController: childController)
        addChildViewController(navVC)
        
    }


}
