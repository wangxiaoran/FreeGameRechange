//
//  TouchScrollView.h
//  FreeGameRechange
//
//  Created by wangxr on 14-6-25.
//  Copyright (c) 2014年 wangxr. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TouchScrollView;
@protocol TouchScrollDelegate<NSObject>
- (void) touchOnTouchScroll:(TouchScrollView*)scrollView;
@end
@interface TouchScrollView : UIScrollView
@property (nonatomic,assign)id <TouchScrollDelegate>touchScrollDelegate;
@end
