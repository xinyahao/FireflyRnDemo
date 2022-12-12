//
//  RCTBridgeModule.m
//  FireflyRnDemo
//
//  Created by xinya on 2022/12/12.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(LoginModule, NSObject)
RCT_EXTERN_METHOD(login:(NSString*)username password:(NSString*)password callback:(RCTResponseSenderBlock)callback)

@end
