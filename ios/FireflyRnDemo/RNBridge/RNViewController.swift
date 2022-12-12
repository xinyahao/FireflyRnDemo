//
//  RNViewController.swift
//  FireflyRnDemo
//
//  Created by xinya on 2022/12/11.
//

import UIKit
import React

class RNViewController: UIViewController {
//    [NSObject : AnyObject]
    init(moduleName: String, initialProperties: NSDictionary ) {
        super.init(nibName: nil, bundle: nil)
//        RCTRootView(bridge: RNBridge().bridge,
//                    moduleName: moduleName,
//                    initialProperties: initialProperties)
        view = RCTRootView(bridge: RNBridgeManager().bridge,
                                   moduleName: moduleName,
                                   initialProperties: initialProperties as [NSObject : AnyObject])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
