//
//  LoginViewController.m
//  FreeGameRechange
//
//  Created by wangxr on 14-6-23.
//  Copyright (c) 2014年 wangxr. All rights reserved.
//

#import "LoginViewController.h"
#import "FindPasswordViewController.h"
#import "CheckoutViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic,retain)UITextField * phoneNoTF;
@property (nonatomic,retain)UITextField * passWordTF;
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"用户登录";
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackButtenWithTarget:@selector(back)];
    
    UIImageView* imageC = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 280, 100)];
    imageC.image = [UIImage imageNamed:@"topinfo"];
    [self.view addSubview:imageC];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 25, 70, 40)];
    nameLabel.text = @"账   号";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor lightGrayColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:15];
    nameLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:nameLabel];
    
    self.phoneNoTF = [[UITextField alloc] initWithFrame:CGRectMake(100, 25, 190, 40)];
    _phoneNoTF.borderStyle = UITextBorderStyleNone;
    _phoneNoTF.font = [UIFont systemFontOfSize:15];
    _phoneNoTF.placeholder = @"请输入注册时的手机号";
    _phoneNoTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _phoneNoTF.keyboardType = UIKeyboardTypeNumberPad;
    _phoneNoTF.keyboardAppearance = UIKeyboardAppearanceAlert;
    _phoneNoTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneNoTF.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:_phoneNoTF];
    
    
    UILabel *pswLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 73, 70, 40)];
    pswLabel.text = @"密   码";
    pswLabel.textAlignment = NSTextAlignmentLeft;
    pswLabel.textColor =[UIColor  lightGrayColor];
    pswLabel.font = [UIFont boldSystemFontOfSize:15];
    pswLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pswLabel];
    
    self.passWordTF = [[UITextField alloc] initWithFrame:CGRectMake(100, 73, 190, 40)];
    _passWordTF.borderStyle = UITextBorderStyleNone;
    _passWordTF.delegate = self;
    _passWordTF.font = [UIFont systemFontOfSize:15];
    _passWordTF.placeholder = @"6-16个字母，数字组成";
    _passWordTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _passWordTF.keyboardType = UIKeyboardTypeEmailAddress;
    _passWordTF.keyboardAppearance = UIKeyboardAppearanceAlert;
    _passWordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passWordTF.autocorrectionType = UITextAutocorrectionTypeNo;
    _passWordTF.returnKeyType = UIReturnKeyDone;
    _passWordTF.secureTextEntry = YES;
    [self.view addSubview:_passWordTF];
    
    
    UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(20, 145,280, 35);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    
    [loginButton setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"title_bg.png"]]];
    [loginButton addTarget:self action: @selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    UIImageView* registerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 200, 280, 100)];
    registerImageView.image = [UIImage imageNamed:@"topinfo"];
    [self.view addSubview:registerImageView];
    
    UILabel *newUserLable = [[UILabel alloc] initWithFrame:CGRectMake(30, 210, 100, 30)];
    newUserLable.text = @"新用户注册";
    [self.view addSubview:newUserLable];
    
    UIImageView *accessImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loging_access_log.png"]];
    accessImageView.frame = CGRectMake(260,218 , 10, 16);
    [self.view addSubview:accessImageView];
    
    UIButton *newUserBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    newUserBtn.backgroundColor = [UIColor clearColor];
    newUserBtn.frame = CGRectMake(20, 200, 280, 50);
    [newUserBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newUserBtn];
    
    UILabel *forGetPsdUserLable = [[UILabel alloc] initWithFrame:CGRectMake(30, 260, 100, 30)];
    forGetPsdUserLable.text = @"找回密码";
    [self.view addSubview:forGetPsdUserLable];
    
    UIImageView *accessForGetImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loging_access_log.png"]];
    accessForGetImageView.frame = CGRectMake(260,268 , 10, 16);
    [self.view addSubview:accessForGetImageView];
    
    UIButton *forGetPsdUserBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forGetPsdUserBtn.backgroundColor = [UIColor clearColor];
    forGetPsdUserBtn.frame = CGRectMake(0, 250, 280, 50);
    [forGetPsdUserBtn addTarget:self action:@selector(forgetPasswordClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forGetPsdUserBtn];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loginButtonClick
{
    [[NSNotificationCenter defaultCenter]postNotificationName:FreeGameRechangeLoginSucceeded object:self userInfo:nil];
    [self back];
}
- (void)registerClick
{
    CheckoutViewController * checkoutVC = [[CheckoutViewController alloc]init];
    [self.navigationController pushViewController:checkoutVC animated:YES];
}
- (void)forgetPasswordClick
{
    FindPasswordViewController * findVC = [[FindPasswordViewController alloc]init];
    [self.navigationController pushViewController:findVC animated:YES];
}
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
     [_passWordTF resignFirstResponder];
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_phoneNoTF resignFirstResponder];
    [_passWordTF resignFirstResponder];
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
