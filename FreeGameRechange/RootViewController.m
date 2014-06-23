//
//  RootViewController.m
//  FreeGameRechange
//
//  Created by wangxr on 14-6-20.
//  Copyright (c) 2014年 wangxr. All rights reserved.
//

#import "RootViewController.h"
#define showWindowViewTag 10086

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed: @"title_bg.png"];
    float h = 0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0){
        h = 64;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    else
        h = 44;
    CGRect rectFrame=CGRectMake(0, 0 ,self.view.frame.size.width,h);
    UIGraphicsBeginImageContext(rectFrame.size);
    [image drawInRect:rectFrame];
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        [self.navigationController.navigationBar setBackgroundImage:newImage forBarMetrics:0];
        
    }
    self.navigationItem.titleView = ({
        UILabel * titleLable = [[UILabel alloc]init];
        titleLable.frame = CGRectMake(0, 0, 200, 30);
        titleLable.backgroundColor = [UIColor clearColor];
        titleLable.textColor = [UIColor whiteColor];
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.font = [UIFont boldSystemFontOfSize:20];
        titleLable.text = self.title;
        titleLable;
    });
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setBackButtenWithTarget:(SEL)selector
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:({
        UIButton * BackButten = [UIButton buttonWithType:UIButtonTypeCustom];
        BackButten.frame = CGRectMake(0.0, 0.0, 50, 30);
        [BackButten setBackgroundImage:[UIImage imageNamed:@"BackButten"] forState:UIControlStateNormal];
        [BackButten addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
        BackButten;
    })];
}
+ (void)showAutoMissHubWithTitle:(NSString*)title Image:(UIImage*)image
{
    [self showHubWithTitle:title Image:image];
    [RootViewController performSelector:@selector(hideWindowHub) withObject:nil afterDelay:1.0f];
}
+ (void)showHubWithTitle:(NSString*)title Image:(UIImage*)image
{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    UIView * showWindowView = [window viewWithTag:10086];
    if (showWindowView != nil) {
        [showWindowView removeFromSuperview];
    }
    showWindowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 100)];
    showWindowView.tag = showWindowViewTag;
    showWindowView.center = window.center;
    showWindowView.backgroundColor = [UIColor blackColor];
    showWindowView.layer.cornerRadius = 5;
    showWindowView.layer.masksToBounds = YES;
    showWindowView.alpha = 0.7;
    UIImageView* warnImage = [[UIImageView alloc] initWithFrame:CGRectMake(95.0/2, 25, 25, 25)];
    warnImage.backgroundColor = [UIColor clearColor];
    [showWindowView addSubview:warnImage];
    warnImage.image = image;
    
    UILabel* showWindowLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 120, 25)];
    showWindowLabel.backgroundColor = [UIColor clearColor];
    showWindowLabel.font = [UIFont boldSystemFontOfSize:15.0];
    showWindowLabel.textColor = [UIColor whiteColor];
    showWindowLabel.textAlignment = NSTextAlignmentCenter;
    showWindowLabel.text = title;
    [showWindowView addSubview:showWindowLabel];
    
    [window addSubview:showWindowView];
}
+ (void)hideWindowHub
{
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    UIView * showWindowView = [window viewWithTag:showWindowViewTag];
    if (showWindowView != nil) {
        [showWindowView removeFromSuperview];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
