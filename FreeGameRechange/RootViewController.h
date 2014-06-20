//
//  RootViewController.h
//  FreeGameRechange
//
//  Created by wangxr on 14-6-20.
//  Copyright (c) 2014年 wangxr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
- (void)setBackButtenWithTarget:(SEL)selector;
+ (void)showAutoMissHubWithTitle:(NSString*)title Image:(UIImage*)image;
@end
