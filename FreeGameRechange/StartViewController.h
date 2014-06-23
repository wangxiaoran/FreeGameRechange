//
//  StartViewController.h
//  FreeGameRechange
//
//  Created by wangxr on 14-6-19.
//  Copyright (c) 2014年 wangxr. All rights reserved.
//
//[[StartViewController sharedStartViewController] showLoginViewController];

#import <UIKit/UIKit.h>
#import "AKTabBarController.h"
@interface StartViewController : UIViewController
@property (nonatomic,retain)AKTabBarController * tabbarC;
+ (StartViewController*)sharedStartViewController;
- (void)showLoginViewController;
@end
