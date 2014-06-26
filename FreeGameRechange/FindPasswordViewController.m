//
//  FindPasswordViewController.m
//  FreeGameRechange
//
//  Created by wangxr on 14-6-25.
//  Copyright (c) 2014年 wangxr. All rights reserved.
//

#import "FindPasswordViewController.h"

@interface FindPasswordViewController ()
@property (nonatomic,retain)UITextField * phoneNoTF;
@end

@implementation FindPasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"找回密码";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackButtenWithTarget:@selector(back)];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 280, 43)];
    imageView.image = [UIImage imageNamed:@"modelinfo_c_bg"];
    [self.view addSubview:imageView];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(30, 31, 50, 20)];
    label.text = @"手机号";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
    
    self.phoneNoTF = [[UITextField alloc]initWithFrame:CGRectMake(90, 31, 190, 20)];
    _phoneNoTF.placeholder = @"注册时使用的手机号";
    _phoneNoTF.font = [UIFont systemFontOfSize:14];
    _phoneNoTF.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_phoneNoTF];
    
    UIButton * cancelB = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelB.frame = CGRectMake(20, 75,120, 35);
    [cancelB setTitle:@"取消" forState:UIControlStateNormal];
    [cancelB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancelB.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    
    [cancelB setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"title_bg.png"]]];
    [cancelB addTarget:self action: @selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelB];
    
    UIButton * findB = [UIButton buttonWithType:UIButtonTypeCustom];
    findB.frame = CGRectMake(180, 75,120, 35);
    [findB setTitle:@"立即找回" forState:UIControlStateNormal];
    [findB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    findB.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    
    [findB setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"title_bg.png"]]];
    [findB addTarget:self action: @selector(findPassword) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:findB];
    
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)findPassword
{
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_phoneNoTF resignFirstResponder];
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
