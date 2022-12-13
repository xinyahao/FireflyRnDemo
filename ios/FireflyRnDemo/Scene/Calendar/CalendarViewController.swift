//
//  CalendarViewController.swift
//  FireflyRnDemo
//
//  Created by xinya on 2022/12/11.
//

import UIKit
import React

class CalendarViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let rootView = RCTAppSetupDefaultRootView(RNBridgeManager.shared().bridge , "AppPage", ["data":["message": "from - swift"]])
        rootView?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view = rootView
    }
}
