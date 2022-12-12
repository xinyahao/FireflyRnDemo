//
//  RNBridge.swift
//  FireflyRnDemo
//
//  Created by xinya on 2022/12/11.
//

import Foundation
import React

class RNBridge {
    let bridge: RCTBridge
    
    init() {
        bridge = RCTBridge(delegate: RNBridgeDelegate(), launchOptions: nil)
    }
}
