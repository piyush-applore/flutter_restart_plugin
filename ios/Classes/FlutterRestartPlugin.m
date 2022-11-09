#import "FlutterRestartPlugin.h"

@implementation FlutterRestartPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"flutter_app_restart" binaryMessenger:[registrar messenger]];
    
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    
    [self logMessage:@"handle" details:call.method];
    
    if ([call.method isEqual:@"restartApp"]) {
        if ([NSThread isMainThread]) {
        [self loadBundle];
    } else {
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self loadBundle];
        });
    }
      result("iOS " + UIDevice.current.systemVersion);
    } else {
        [self logMessage:@"method not implemented"];
        result(FlutterMethodNotImplemented);
    }
}

@end
