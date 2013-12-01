//
//  FTLoginInfo.m
//  CloudSlides
//
//  Created by Bowen Liang on 13-11-30.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import "FTLoginInfo.h"

@implementation FTLoginInfo

-(FTLoginInfo *) initWithEmail:(NSString *)aEmail withToken:(NSString *)aToken withDisplayName:(NSString *)aDisplayName
{
    self = [super init];
    if (self) {
        self->email = [[NSString alloc] initWithString:aEmail];
        self->token = [[NSString alloc] initWithString:aToken];
        self->displayName = [[NSString alloc] initWithString:aDisplayName];
    }
    return self;
}

@end
