
#import <Cordova/CDV.h>
#import "AppInfoSync.h"

@implementation AppInfoSync

- (void)getAppInfo:(CDVInvokedUrlCommand *)command
{
    NSDictionary *infoDict = NSBundle.mainBundle.infoDictionary;
    
    NSString *identifier = infoDict[@"CFBundleIdentifier"];
    
    NSDictionary *appInfo = @{
                              @"identifier": identifier,
                              };
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:appInfo];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end