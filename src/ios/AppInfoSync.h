
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface AppInfoSync : CDVPlugin

- (void)getAppInfo:(CDVInvokedUrlCommand*) command;

@end