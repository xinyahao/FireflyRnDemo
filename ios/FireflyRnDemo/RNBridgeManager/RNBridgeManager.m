//
//  RNBridgeManager.m
//  FireflyRnDemo
//
//  Created by xinya on 2022/12/12.
//

#import "RNBridgeManager.h"

#import <React/RCTBundleURLProvider.h>


//dev模式下:RCTBridge required dispatch_sync to load RCTDevLoadingView Error Fix

#if RCT_DEV

#import <React/RCTDevLoadingView.h>

#endif


@implementation RNBridgeManager

static RNBridgeManager *manager;

+ (instancetype)sharedManager{
    if (manager == nil) {
        manager = [[self alloc] init];
    }
    return manager;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    if (manager == nil) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [super allocWithZone:zone];
        });
    }
    return manager;
}

-(instancetype)init{
    if (self = [super init]) {
        _bridge = [[RCTBridge alloc] initWithDelegate: self launchOptions:nil];
    }
    return self;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge {
    # if DEBUG
        return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
    # else
        return [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"jsbundle"];
    #endif
}


@end
