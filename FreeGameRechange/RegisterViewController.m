//
//  RegisterViewController.m
//  FreeGameRechange
//
//  Created by wangxr on 14-6-25.
//  Copyright (c) 2014年 wangxr. All rights reserved.
//

#import "RegisterViewController.h"
#import "TouchScrollView.h"

@interface RegisterViewController ()<TouchScrollDelegate>
@property(nonatomic,retain)TouchScrollView *scrollView;
@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"用户注册";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackButtenWithTarget:@selector(back)];
    self.scrollView = [[TouchScrollView alloc]initWithFrame:self.view.frame];
    _scrollView.touchScrollDelegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];
    
    
}
- (void) touchOnTouchScroll:(TouchScrollView*)scrollView
{
    
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
