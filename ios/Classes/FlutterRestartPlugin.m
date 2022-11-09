#import "FlutterRestartPlugin.h"

@implementation FlutterRestartPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterRestartPlugin registerWithRegistrar:registrar];
}
@end
