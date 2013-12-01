//
//  FTLoginInfoController.h
//  CloudSlides
//
//  Created by Bowen Liang on 13-11-30.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FTLoginInfo.h"

@interface FTLoginInfoController : NSObject

+ (FTLoginInfo *) getLoginInfo;
+ (void) setLoginInfo:(FTLoginInfo *)loginInfo;

@end
