
#import <Cordova/CDV.h>
#import "AppInfoSync.h"

@implementation AppInfoSync

- (void)getAppInfo:(CDVInvokedUrlCommand *)command
{
    NSDictionary *infoDict = NSBundle.mainBundle.infoDictionary;
    
    NSString *name = infoDict[@"CFBundleDisplayName"];
    NSString *identifier = infoDict[@"CFBundleIdentifier"];
    NSString *version = infoDict[@"CFBundleShortVersionString"];
    NSString *versionCode = infoDict[@"CFBundleVersion"];
    
    BOOL debug = NO;
#ifdef DEBUG
    debug = YES;
#endif
    
    NSDictionary *appInfo = @{
                              @"name": name,
                              @"identifier": identifier,
                              @"version": version,
                              @"versionCode": versionCode,
                              @"build": versionCode,
                              @"debug": [NSNumber numberWithBool:debug],
                              };
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:appInfo];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end