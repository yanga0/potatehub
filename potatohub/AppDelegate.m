//
//  AppDelegate.m
//  potatohub
//
//  Created by Yan Gao on 7/7/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import "AppDelegate.h"
#import "Base64.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <AVOSCloud/AVOSCloud.h>
#import "QiniuSDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString *appid = @"w13uetn3fizp2cda6app367io8zxtzwhmq2mkwykoohycvos";
    NSString *appkey = @"fyzyg0wm494hdi0qguu6otstxz9uj3iv3stv88af0sqilbbl";
    NSString *masterkey = @"sy0jg48u248cakoo4hppmj8trlewdfkleldx4kufr62xv52g";
    [AVOSCloud setApplicationId:@"{{appid}}" clientKey:@"{{appkey}}"];
    [AVOSCloud setApplicationId: appid clientKey: appkey];
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    return YES;
}

- (NSString *)HMAC_SHA1:(NSString *)data secret:(NSString *)key {
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
    return [HMAC base64EncodedString];
}

- (NSString *)realDownloadUrl:(NSString *)url {
//    NSString *qiniuDomain = @"http://7xk7io.com1.z0.glb.clouddn.com";
    NSString *accessKey = @"cp2RkvD2AhdJU0fgwnkFheQEqFKWsXcEi_d4Ewnu";
    NSString *secretKey = @"S5jh4gk1aGyDBRoBD84-egejUOrqxNilTW2DjAFd";
    NSString *urlWithTimestamp = [NSString stringWithFormat:@"%@?e=%@", url, [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]]];
    NSString *sign = [self HMAC_SHA1:urlWithTimestamp secret:secretKey];
    NSString *encodedSign = [QNUrlSafeBase64 encodeString: sign];
    NSString *token = [NSString stringWithFormat:@"%@:%@", accessKey, encodedSign];
    NSString *realUrl = [NSString stringWithFormat:@"%@&token=%@", urlWithTimestamp, token];
    return realUrl;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
