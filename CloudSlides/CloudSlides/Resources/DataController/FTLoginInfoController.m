//
//  FTLoginInfoController.m
//  CloudSlides
//
//  Created by Bowen Liang on 13-11-30.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import "FTLoginInfoController.h"

static NSString *keyForEmail = @"loginInfo_email";
static NSString *keyForToken = @"loginInfo_token";
static NSString *keyForDisplayName = @"loginInfo_displayName";

@implementation FTLoginInfoController

+ (FTLoginInfo *) getLoginInfo{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *email = [userDefaults stringForKey:keyForEmail];
    NSString *token = [userDefaults stringForKey:keyForToken];
    NSString *displayName = [userDefaults stringForKey:keyForDisplayName];
    if (email==nil && token==nil && displayName==nil) {
        return nil; //userDefaults中无用户登录信息
    }
    FTLoginInfo * loginInfo = [[FTLoginInfo alloc] initWithEmail:email withToken:token withDisplayName:displayName];
    return loginInfo;
}

+ (void) setLoginInfo:(FTLoginInfo*)loginInfo{
    if (loginInfo==nil || loginInfo->email==nil || loginInfo->token==nil){
        NSLog(@"%@", @"loginInfo is nil. setLoginInfo failed");
        return;
    }
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[[NSString alloc] initWithString:loginInfo->email] forKey:keyForEmail];
    [userDefaults setObject:[[NSString alloc] initWithString:loginInfo->token] forKey:keyForToken];
    [userDefaults setObject:[[NSString alloc] initWithString:loginInfo->displayName] forKey:keyForDisplayName];
    
    [userDefaults synchronize]; //持久化userDefaults
}


@end
