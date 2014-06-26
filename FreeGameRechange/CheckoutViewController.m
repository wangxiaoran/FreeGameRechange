//
//  CheckoutViewController.m
//  FreeGameRechange
//
//  Created by wangxr on 14-6-25.
//  Copyright (c) 2014年 wangxr. All rights reserved.
//

#import "CheckoutViewController.h"
#import "RegisterViewController.h"

@interface CheckoutViewController ()
{
    UIButton * checkoutB;
    NSTimer * timer;
}
@property (nonatomic,retain)UITextField* phoneNoTF;
@property (nonatomic,retain)UITextField* checkoutNoTF;
@end

@implementation CheckoutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"验证手机号";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackButtenWithTarget:@selector(back)];
    UIImageView* imageC = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 280, 40)];
    imageC.image = [UIImage imageNamed:@"modelinfo_c_bg"];
    [self.view addSubview:imageC];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 100, 40)];
    nameLabel.text = @"手机号码";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor lightGrayColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:15];
    nameLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:nameLabel];
    
    self.phoneNoTF = [[UITextField alloc] initWithFrame:CGRectMake(100, 20, 190, 40)];
    _phoneNoTF.borderStyle = UITextBorderStyleNone;
    _phoneNoTF.font = [UIFont systemFontOfSize:15];
    _phoneNoTF.placeholder = @"请输入您的的手机号";
    _phoneNoTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _phoneNoTF.keyboardType = UIKeyboardTypeNumberPad;
    _phoneNoTF.keyboardAppearance = UIKeyboardAppearanceAlert;
    _phoneNoTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneNoTF.autocorrectionType = UITextAutocorrectionTypeNo;
    _phoneNoTF.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_phoneNoTF];
    
    UIImageView* imageD = [[UIImageView alloc] initWithFrame:CGRectMake(20, 120, 280, 40)];
    imageD.image = [UIImage imageNamed:@"modelinfo_c_bg"];
    [self.view addSubview:imageD];
    
    UILabel *pswLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, 100, 40)];
    pswLabel.text = @"验 证 码";
    pswLabel.textAlignment = NSTextAlignmentLeft;
    pswLabel.textColor =[UIColor lightGrayColor];
    pswLabel.font = [UIFont boldSystemFontOfSize:15];
    pswLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pswLabel];
    
    self.checkoutNoTF = [[UITextField alloc] initWithFrame:CGRectMake(100, 120, 190, 40)];
    _checkoutNoTF.borderStyle = UITextBorderStyleNone;
    _checkoutNoTF.font = [UIFont systemFontOfSize:15];
    _checkoutNoTF.placeholder = @"请输入验证码";
    _checkoutNoTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _checkoutNoTF.keyboardType = UIKeyboardTypeNumberPad;
    _checkoutNoTF.keyboardAppearance = UIKeyboardAppearanceAlert;
    _checkoutNoTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _checkoutNoTF.autocorrectionType = UITextAutocorrectionTypeNo;
    _checkoutNoTF.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_checkoutNoTF];
    
    checkoutB = [UIButton buttonWithType:UIButtonTypeCustom];
    checkoutB.frame = CGRectMake(20, 70, 280, 40);
    [self.view addSubview:checkoutB];
    [checkoutB setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkoutB setBackgroundImage:[UIImage imageNamed:@"checkout"] forState:UIControlStateNormal];
    [checkoutB setTitle:@"发送验证码到手机" forState:UIControlStateNormal];
    [checkoutB addTarget:self action:@selector(getCheckoutNo) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * querenB = [UIButton buttonWithType:UIButtonTypeCustom];
    querenB.frame = CGRectMake(20, self.view.frame.size.height-200,280, 35);
    [querenB setTitle:@"确认" forState:UIControlStateNormal];
    [querenB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [querenB setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"title_bg.png"]]];
    [querenB addTarget:self action: @selector(checkout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:querenB];
}
- (void)timeDone
{
    if ([checkoutB.titleLabel.text intValue] > 0) {
        checkoutB.enabled =YES;
        [checkoutB setTitle:[NSString stringWithFormat:@"%ds之后可以重新发送",[checkoutB.titleLabel.text intValue]-1] forState:UIControlStateNormal];
        checkoutB.enabled =NO;
    }else
    {
        checkoutB.enabled =YES;
        [checkoutB setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [checkoutB setTitle:@"发送验证码到手机" forState:UIControlStateNormal];
        if (timer != nil) {
            if( [timer isValid])
            {
                [timer invalidate];
            }
            timer = nil;
        }
    }
}
- (void)getCheckoutNo
{
    [_phoneNoTF resignFirstResponder];
    [_checkoutNoTF resignFirstResponder];
    checkoutB.enabled =NO;
    [checkoutB setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [checkoutB setTitle:@"60s之后可以重新发送" forState:UIControlStateNormal];
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeDone) userInfo:nil repeats:YES];
}
- (void)checkout
{
    RegisterViewController * registerVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_phoneNoTF resignFirstResponder];
    [_checkoutNoTF resignFirstResponder];
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
