//
//  StartViewController.m
//  FreeGameRechange
//
//  Created by wangxr on 14-6-19.
//  Copyright (c) 2014年 wangxr. All rights reserved.
//

#import "StartViewController.h"
#import "RobCardViewController.h"
#import "FreeGradeViewController.h"
#import "ActivityCenterViewController.h"
#import "UserCenterViewController.h"
#import "LoginViewController.h"
static StartViewController* startViewController;
@interface StartViewController ()

@end

@implementation StartViewController

+ (StartViewController*)sharedStartViewController
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        startViewController=[[self alloc] init];
        
    });
    return startViewController;
}
- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabbarC = [[AKTabBarController alloc]initWithTabBarHeight:50];
    RobCardViewController * robCardVC = [[RobCardViewController alloc]init];
    FreeGradeViewController * freeGradeVC = [[FreeGradeViewController alloc] init];
    ActivityCenterViewController * activityCenterVC = [[ActivityCenterViewController alloc] init];
    UserCenterViewController * userCenterVC = [[UserCenterViewController alloc] init];
    [_tabbarC setViewControllers:
     [NSMutableArray arrayWithObjects:
      [[UINavigationController alloc] initWithRootViewController:robCardVC],
      [[UINavigationController alloc] initWithRootViewController:freeGradeVC],
      [[UINavigationController alloc] initWithRootViewController:activityCenterVC],
      [[UINavigationController alloc] initWithRootViewController:userCenterVC],
      nil]
     ];
    // Tab background Image
    [_tabbarC setBackgroundImageName:@"noise-dark-gray.png"];
    [_tabbarC setSelectedBackgroundImageName:@"noise-dark-blue.png"];
    // Icons Color settings
    [_tabbarC setIconColors:@[[UIColor colorWithRed:174.0/255.0 green:174.0/255.0 blue:174.0/255.0 alpha:1],
                             [UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1]]]; // MAX 2 Colors
    
    [_tabbarC setSelectedIconColors:@[[UIColor colorWithRed:174.0/255.0 green:174.0/255.0 blue:174.0/255.0 alpha:1],
                                     [UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1]]]; // MAX 2 Colors
    
    // Text Color
    [_tabbarC setTextColor:[UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:1.0]];
    [_tabbarC setSelectedTextColor:[UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1.0]];
    [self addChildViewController:_tabbarC];
    [_tabbarC.view setFrame:self.view.bounds];
    [self.view addSubview:_tabbarC.view];
    
}
- (void)showLoginViewController
{
    LoginViewController * loginViewC = [[LoginViewController alloc]init];
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:loginViewC] animated:YES completion:nil];
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
