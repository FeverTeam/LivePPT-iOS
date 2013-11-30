//
//  FTLoginViewController.m
//  CloudSlides
//
//  Created by Bowen Liang on 13-11-29.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import "FTLoginViewController.h"


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

- (IBAction)loginBtnPressed:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"hi" message:@"login pressed" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles: nil];
    [alertView show];
}

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




@end
