//
//  AppDelegate.h
//  potatohub
//
//  Created by Yan Gao on 7/7/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVOSCloud/AVUser.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) AVUser *currentUser;

@end

