//
//  RegisterViewController.m
//  FreeGameRechange
//
//  Created by wangxr on 14-6-25.
//  Copyright (c) 2014年 wangxr. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property(nonatomic,retain)UITextField * passwordTF;
@property(nonatomic,retain)UITextField * affirmPassTF;

@property(nonatomic,retain)UITextField * inviteNoTF;
@property(nonatomic,retain)UIView * inviteNoView;
@property(nonatomic,retain)UISwitch * inviteNoSwitch;
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
    
    UIImageView * imageA = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 280, 50)];
    imageA.image = [UIImage imageNamed:@"modelinfo_c_bg"];
    [self.view addSubview:imageA];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 35, 100, 20)];
    nameLabel.text = @"手机号码";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor lightGrayColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:15];
    nameLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:nameLabel];
    
    UILabel *phoneL = [[UILabel alloc] initWithFrame:CGRectMake(130, 35, 150, 20)];
    phoneL.text = self.phoneNo;
    phoneL.textColor = [UIColor blackColor];
    phoneL.font = [UIFont boldSystemFontOfSize:15];
    phoneL.backgroundColor = [UIColor clearColor];
    [self.view addSubview:phoneL];
    
    UIImageView* imageC = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 280, 100)];
    imageC.image = [UIImage imageNamed:@"topinfo"];
    [self.view addSubview:imageC];
    
    UILabel *passL = [[UILabel alloc] initWithFrame:CGRectMake(30, 105, 70, 40)];
    passL.text = @"登录密码";
    passL.textAlignment = NSTextAlignmentLeft;
    passL.textColor = [UIColor lightGrayColor];
    passL.font = [UIFont boldSystemFontOfSize:15];
    passL.backgroundColor = [UIColor clearColor];
    [self.view addSubview:passL];
    
    self.passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(100, 105, 190, 40)];
    _passwordTF.borderStyle = UITextBorderStyleNone;
    _passwordTF.font = [UIFont systemFontOfSize:15];
    _passwordTF.placeholder = @"6-16个字母、数字组成";
    _passwordTF.keyboardType = UIKeyboardTypeEmailAddress;
    _passwordTF.keyboardAppearance = UIKeyboardAppearanceAlert;
    _passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordTF.autocorrectionType = UITextAutocorrectionTypeNo;
    _passwordTF.returnKeyType = UIReturnKeyDone;
    _passwordTF.secureTextEntry = YES;
    _passwordTF.delegate = self;
    [self.view addSubview:_passwordTF];
    
    
    UILabel *pswLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 155, 70, 40)];
    pswLabel.text = @"确认密码";
    pswLabel.textAlignment = NSTextAlignmentLeft;
    pswLabel.textColor =[UIColor  lightGrayColor];
    pswLabel.font = [UIFont boldSystemFontOfSize:15];
    pswLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pswLabel];
    
    self.affirmPassTF = [[UITextField alloc] initWithFrame:CGRectMake(100, 155, 190, 40)];
    _affirmPassTF.borderStyle = UITextBorderStyleNone;
    _affirmPassTF.font = [UIFont systemFontOfSize:15];
    _affirmPassTF.placeholder = @"重新输入密码";
    _affirmPassTF.keyboardType = UIKeyboardTypeEmailAddress;
    _affirmPassTF.keyboardAppearance = UIKeyboardAppearanceAlert;
    _affirmPassTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _affirmPassTF.autocorrectionType = UITextAutocorrectionTypeNo;
    _affirmPassTF.returnKeyType = UIReturnKeyDone;
    _affirmPassTF.secureTextEntry = YES;
    _affirmPassTF.delegate = self;
    [self.view addSubview:_affirmPassTF];
    
    UILabel *inviteLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 220, 190, 40)];
    inviteLabel.text = @"是否填写邀请码";
    inviteLabel.textAlignment = NSTextAlignmentLeft;
    inviteLabel.textColor =[UIColor  blackColor];
    inviteLabel.font = [UIFont boldSystemFontOfSize:18];
    inviteLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:inviteLabel];
    
    self.inviteNoSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(240, 225, 60, 30)];
    [_inviteNoSwitch addTarget:self action:@selector(openInviteNo) forControlEvents:UIControlEventValueChanged];
    _inviteNoSwitch.on = NO;
    [self.view addSubview:_inviteNoSwitch];
    
    UIImageView * imageB = [[UIImageView alloc]initWithFrame:CGRectMake(20, 270, 280, 50)];
    imageB.image = [UIImage imageNamed:@"modelinfo_c_bg"];
    [self.view addSubview:imageB];
    
    UILabel *inviteL = [[UILabel alloc] initWithFrame:CGRectMake(30, 285, 100, 20)];
    inviteL.text = @"邀请码";
    inviteL.textAlignment = NSTextAlignmentLeft;
    inviteL.textColor = [UIColor lightGrayColor];
    inviteL.font = [UIFont boldSystemFontOfSize:15];
    inviteL.backgroundColor = [UIColor clearColor];
    [self.view addSubview:inviteL];
    
    self.inviteNoTF = [[UITextField alloc] initWithFrame:CGRectMake(100, 285, 190, 20)];
    _inviteNoTF.borderStyle = UITextBorderStyleNone;
    _inviteNoTF.font = [UIFont systemFontOfSize:15];
    _inviteNoTF.placeholder = @"请输入邀请码";
    _inviteNoTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _inviteNoTF.keyboardType = UIKeyboardTypeNumberPad;
    _inviteNoTF.keyboardAppearance = UIKeyboardAppearanceAlert;
    _inviteNoTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _inviteNoTF.autocorrectionType = UITextAutocorrectionTypeNo;
    _inviteNoTF.returnKeyType = UIReturnKeyDone;
    _inviteNoTF.delegate = self;
    [self.view addSubview:_inviteNoTF];
    
    self.inviteNoView = [[UIView alloc]initWithFrame:CGRectMake(0, 270, 320, 100)];
    _inviteNoView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:_inviteNoView];
    
    UIButton * registerB = [UIButton buttonWithType:UIButtonTypeCustom];
    registerB.frame = CGRectMake(20, 50,280, 35);
    [registerB setTitle:@"确定" forState:UIControlStateNormal];
    [registerB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    registerB.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [registerB setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"title_bg.png"]]];
    [registerB addTarget:self action: @selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_inviteNoView addSubview:registerB];
    
    UIButton * userAgreementB = [[UIButton alloc]initWithFrame:CGRectMake(40, 15, 240, 20)];
    [userAgreementB setTitle:@"《阅读并同意用户服务协议》" forState:UIControlStateNormal];
    [userAgreementB setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    userAgreementB.titleLabel.font = [UIFont systemFontOfSize:14];
    [_inviteNoView addSubview:userAgreementB];
    
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_passwordTF resignFirstResponder];
    [_affirmPassTF resignFirstResponder];
    [_inviteNoTF resignFirstResponder];
}
- (void)registerButtonClick
{
    [[NSNotificationCenter defaultCenter]postNotificationName:FreeGameRechangeLoginSucceeded object:self userInfo:nil];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)openInviteNo
{
    if (_inviteNoSwitch.on) {
        _inviteNoView.frame = CGRectMake(0, 320, 320, 100);
    }else
    {
        _inviteNoView.frame = CGRectMake(0, 270, 320, 100);
    }
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
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField isEqual:_inviteNoTF]) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0, -100, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField isEqual:_inviteNoTF]) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0, [UIDevice currentDevice].systemVersion.floatValue >= 7.0?64:44, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
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
