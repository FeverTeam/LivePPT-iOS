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

//TextFields
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

//Buttons
@property (weak, nonatomic) IBOutlet FUIButton *loginBtn;

//Events
//-(void) loginWithEmail:(NSString *)email withPassword:(NSString *)password;

@end
