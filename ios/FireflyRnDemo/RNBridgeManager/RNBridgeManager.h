#import <Foundation/Foundation.h>

#import <React/RCTBridge.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTBridgeDelegate.h>
@interface RNBridgeManager : NSObject<RCTBridgeDelegate>


+ (instancetype)sharedManager;
@property (nonatomic, readonly, strong) RCTBridge *bridge;

@end
