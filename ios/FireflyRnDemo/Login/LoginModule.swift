//
//  LoginModule.swift
//  FireflyRnDemo
//
//  Created by xinya on 2022/12/12.
//

import Foundation
import UIKit
import AVFoundation

@objc(LoginModule)
class LoginModule: NSObject {

    @objc func login(_ username: String, password: String, callback: RCTResponseSenderBlock) {
        NSLog("%@, %@", username, password);
        callback(["HNDwlLMayZN6ciTw"])
    }
    
    @objc func requiresMainQueueSetup() -> Bool {
        return true
    }

}
