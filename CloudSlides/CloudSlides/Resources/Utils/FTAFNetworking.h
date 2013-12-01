//
//  FTAFNetworking.h
//  CloudSlides
//
//  Created by Bowen Liang on 13-12-1.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

@interface FTAFNetworking : NSObject

+(AFHTTPRequestOperationManager*) sharedManager;

+(AFHTTPRequestOperationManager*) sharedManagerWithTokenHeaders;

@end
