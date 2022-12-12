//
//  MainTabBarController.swift
//  FireflyRnDemo
//
//  Created by xinya on 2022/12/11.
//

import UIKit
import React

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initTabBar()
    }
    
    func initTabBar() {
        let home = HomeViewController()
        let homeNav = UINavigationController(rootViewController: home)
        homeNav.tabBarItem.title = "Home"
        homeNav.tabBarItem.image = UIImage(systemName: "house")
        
        let calendar = RNViewController(moduleName: "FireflyRnDemo", initialProperties: ["data":["message": "from - swift"]])
        let calendarNav = UINavigationController(rootViewController: calendar)
        calendarNav.tabBarItem.title = "Calendar"
        calendarNav.tabBarItem.image = UIImage(systemName: "calendar")

        let mine = MineViewController()
        let mineNav = UINavigationController(rootViewController: mine)
        mineNav.tabBarItem.title = "Mine"
        mineNav.tabBarItem.image = UIImage(systemName: "person")

        viewControllers = [homeNav, calendarNav, mineNav]
        
        view.backgroundColor = .lightGray
        setTabBarItemAttributes(bgColor: UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1))
    }
    
    func setTabBarItemAttributes(fontName: String = "Courier",
                                 fontSize: CGFloat = 14,
                                 normalColor: UIColor = .gray,
                                 selectedColor: UIColor = .blue,
                                 bgColor: UIColor = .white) {
        
        // tabBarItem 文字大小
        var attributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: fontName, size: fontSize)!]

        // tabBarItem 文字默认颜色
        attributes[.foregroundColor] = normalColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)

        // tabBarItem 文字选中颜色
        attributes[.foregroundColor] = selectedColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)

        // tabBar 文字、图片 统一选中高亮色
        tabBar.tintColor = selectedColor

        // tabBar 背景色
        tabBar.barTintColor = bgColor
        
        tabBar.backgroundColor = .lightGray
        
    }


}

