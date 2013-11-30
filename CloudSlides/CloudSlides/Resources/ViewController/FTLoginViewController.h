//
//  FTLoginViewController.h
//  CloudSlides
//
//  Created by Bowen Liang on 13-11-29.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"

@interface FTLoginViewController : UIViewController<UITextFieldDelegate> 

@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;



@property (weak, nonatomic) IBOutlet FUIButton *loginBtn;

@end
