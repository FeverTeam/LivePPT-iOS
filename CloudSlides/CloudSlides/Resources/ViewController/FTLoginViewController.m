//
//  FTLoginViewController.m
//  CloudSlides
//
//  Created by Bowen Liang on 13-11-29.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import "FTLoginViewController.h"

#import "AFNetworking.h"
#import "CommonCrypto/CommonDigest.h"
#import "CommonCrypto/CommonHMAC.h"
#import "FTAFNetworking.h"
#import "FTEmailValidation.h"
#import "FTResponse.h"
#import "FTLoginInfo.h"
#import "FTLoginInfoController.h"
#import "FTHMAC.h"
#import <GHKit/GHKit.h>


@interface FTLoginViewController ()

@end

@implementation FTLoginViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO; //显示导航栏
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.loginBtn.buttonColor = [UIColor turquoiseColor];
    self.loginBtn.shadowColor = [UIColor greenSeaColor];
    self.loginBtn.shadowHeight = 3.0f;
    self.loginBtn.cornerRadius = 6.0f;
    self.loginBtn.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.loginBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    //TextField
    //指定代理
    self.emailText.delegate = self;
    self.passwordText.delegate = self;
    //指定return键类型
    self.emailText.returnKeyType = UIReturnKeyNext;
    self.passwordText.returnKeyType = UIReturnKeyDefault;
    
    self.emailText.text = @"simonlbw@gmail.com";
    self.passwordText.text = @"simonlbw";
    
    
    
    //注册键盘响应事件方法
    [self.emailText addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.passwordText addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    
    //添加手势，点击屏幕其他区域关闭键盘的操作
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];
    
    [self.emailText becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//登录按钮-点击
- (IBAction)loginBtnPressed:(id)sender {
    
    //获取文本框内容
    NSString *email_str = self.emailText.text;
    NSString *password_str = self.passwordText.text;
    if (email_str.length == 0 || password_str.length == 0){
        return;
    }
    
    [self loginWithEmail:email_str password:password_str];
    
}

//注册按钮-点击
- (IBAction)registerBtnPressed:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"hi" message:@"register pressed" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles: nil];
    [alertView show];
}

//UITextFiledDelegate方法
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

//隐藏键盘
-(void)hidenKeyboard
{
    [self.emailText resignFirstResponder];
    [self.passwordText resignFirstResponder];
    //     [self resumeView];
}


//点击键盘上的Return按钮响应的方法
-(IBAction)nextOnKeyboard:(UITextField *)sender
{
    if (sender == self.emailText) {
        [self.passwordText becomeFirstResponder];
    }else if (sender == self.passwordText){
        [self hidenKeyboard];
    }
}

//登录
-(void) loginWithEmail:(NSString *)email password:(NSString *)password{
    //检查email格式是否正确
    if (![FTEmailValidation isEmailCorrect:email]) {
        [self.emailText becomeFirstResponder];
        [self showAlertViewWithMessage:@"Email格式不正确哦" title:@""];
        return;
    }
    
    //生成随机字符串并对密码进行HMAC
    NSString *seed = [[NSString alloc] initWithFormat:@"%i", arc4random()];
    NSString *sign = [FTHMAC hmacHex:password withSecret:seed];
    
    //发起登录网络请求
    AFHTTPRequestOperationManager *manager = [FTAFNetworking sharedManager];
    NSDictionary *parameters = @{@"uemail": email, @"password":sign, @"seed":seed};
    [manager POST:@"/user/login" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        FTResponse *response = [[FTResponse alloc] initWithJsonObject:responseObject];
        switch (response->retcode) {
            case 0:{
                //登录成功
                NSString *displayName = [response->data objectForKey:@"displayName"];
                NSString *token = [response->data objectForKey:@"token"];
                
                FTLoginInfo *loginInfo = [[FTLoginInfo alloc] initWithEmail:email withToken:token withDisplayName:displayName];
                [FTLoginInfoController setLoginInfo:loginInfo];
                [self showAlertViewWithMessage:@"登录成功" title:@""];
                break;
            }
            case -202: {
                //用户名未注册
                [self showAlertViewWithMessage:@"用户名未注册" title:@"登录失败"];
                break;
            }
            case -203: {
                //账号密码配对失败
                [self showAlertViewWithMessage:@"帐号密码不正确" title:@"登录失败"];
                break;
            }
            default: {
                NSLog(@"warning response:%@", response);
            }
                break;
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(void) showAlertViewWithMessage:(NSString *)message title:(NSString *)title {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"明白" otherButtonTitles: nil];
    [alertView show];
}

@end
