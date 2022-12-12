//
//  RNBridgeDelegate.swift
//  FireflyRnDemo
//
//  Created by xinya on 2022/12/11.
//

import Foundation
import React

class RNBridgeDelegate: NSObject, RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
//        return URL(string: "http://localhost:8081/index.bundle?platform=ios")
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index.js", fallbackExtension: nil)
    }
}
