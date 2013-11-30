//
//  FTViewController.m
//  CloudSlides
//
//  Created by Bowen Liang on 13-11-28.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import "FTViewController.h"

#import "UIFont+FlatUI.h"

@interface FTViewController ()

@end

@implementation FTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.navigationItem setHidesBackButton:YES];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES; //隐藏导航栏
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn1Pressed:(id)sender {
    [self performSegueWithIdentifier:@"segue_login" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}

@end
