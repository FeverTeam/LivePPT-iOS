//
//  FTAFNetworking.m
//  CloudSlides
//
//  Created by Bowen Liang on 13-12-1.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import "FTAFNetworking.h"

#import "FTLoginInfoController.h"


static AFHTTPRequestOperationManager * _sharedAFHTTPRequestOperationManager;

@implementation FTAFNetworking


+(AFHTTPRequestOperationManager*) sharedManager {
    if (_sharedAFHTTPRequestOperationManager ==nil) {
        _sharedAFHTTPRequestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[[NSURL alloc] initWithString:@"http://cloudslides.net"]];
    }
    return _sharedAFHTTPRequestOperationManager;
}

+(AFHTTPRequestOperationManager*) sharedManagerWithTokenHeaders {
    AFHTTPRequestOperationManager *manager = [self sharedManager];
    
    FTLoginInfo *loginInfo = [FTLoginInfoController getLoginInfo];
    
    [manager.requestSerializer setValue:loginInfo->email forHTTPHeaderField:@"uemail"];
    [manager.requestSerializer setValue:loginInfo->token  forHTTPHeaderField:@"token"];
    
    return manager;
}

@end
