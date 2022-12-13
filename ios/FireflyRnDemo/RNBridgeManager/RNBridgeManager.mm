
#import "RNBridgeManager.h"
#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

// dev模式下:RCTBridge required dispatch_sync to load RCTDevLoadingView Error Fix

#if RCT_DEV

#import <React/RCTDevLoadingView.h>

#endif

@interface RNBridgeManager () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}
@end
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

- (instancetype)init{
    if (self = [super init]) {
        _bridge = [[RCTBridge alloc] initWithDelegate: self launchOptions:nil];
         #if RCT_NEW_ARCH_ENABLED
            _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
            _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
            _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
            _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:_bridge contextContainer:_contextContainer];
            _bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
         #endif
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


#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
