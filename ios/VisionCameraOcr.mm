#import <Foundation/Foundation.h>
#import <VisionCamera/FrameProcessorPlugin.h>
#import <VisionCamera/FrameProcessorPluginRegistry.h>
#import <VisionCamera/Frame.h>


#if __has_include("react-native-vision-camera-ocr/react-native-vision-camera-ocr-Swift.h")
#import "react-native-vision-camera-ocr/react-native-vision-camera-ocr-Swift.h"
#else
#import "VisionCameraOcr-Swift.h"
#endif

@interface VisionCameraOcr (FrameProcessorPluginLoader)
@end

@implementation VisionCameraOcr (FrameProcessorPluginLoader)
+ (void) load {
  [FrameProcessorPluginRegistry addFrameProcessorPlugin:@"scanText"
    withInitializer:^FrameProcessorPlugin*(VisionCameraProxyHolder* proxy, NSDictionary* options) {
    return [[VisionCameraOcr alloc] initWithProxy:proxy withOptions:options];
  }];
}
@end



@interface VisionCameraOcrTranslator (FrameProcessorPluginLoader)
@end

@implementation VisionCameraOcrTranslator (FrameProcessorPluginLoader)
+ (void) load {
  [FrameProcessorPluginRegistry addFrameProcessorPlugin:@"translate"
    withInitializer:^FrameProcessorPlugin*(VisionCameraProxyHolder* proxy, NSDictionary* options) {
    return [[VisionCameraOcrTranslator alloc] initWithProxy:proxy withOptions:options];
  }];
}
@end





#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(RemoveLanguageModel, NSObject)

RCT_EXTERN_METHOD(remove:(NSString *)code
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end

@interface RCT_EXTERN_MODULE(TextRecognizerModule, NSObject)

RCT_EXTERN_METHOD(process:(NSString *)uri
                  orientation:(NSString *)orientation
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)


+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
