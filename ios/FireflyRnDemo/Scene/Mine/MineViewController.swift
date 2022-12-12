//
//  MineViewController.swift
//  FireflyRnDemo
//
//  Created by xinya on 2022/12/11.
//

import UIKit

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let button = UIButton(type: .system)
        button.frame = CGRectMake(50, 64, 180, 100)
        button.setTitle("Login", for: .normal)
        view.addSubview(button)

        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
    }
    
    @objc func buttonClick() {
        let rootView = RCTRootView(bridge: RNBridgeManager().bridge,
                                   moduleName: "Login",
                                   initialProperties: ["data":["message": "from - swift"]]);
        rootView.frame = CGRect(x: 0, y: 160, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.addSubview(rootView)
    }
}
