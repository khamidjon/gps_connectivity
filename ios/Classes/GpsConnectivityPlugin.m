#import "GpsConnectivityPlugin.h"
#if __has_include(<gps_connectivity/gps_connectivity-Swift.h>)
#import <gps_connectivity/gps_connectivity-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "gps_connectivity-Swift.h"
#endif

@implementation GpsConnectivityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGpsConnectivityPlugin registerWithRegistrar:registrar];
}
@end
