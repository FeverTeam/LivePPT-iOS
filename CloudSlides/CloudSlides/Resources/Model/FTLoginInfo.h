//
//  FTLoginInfo.h
//  CloudSlides
//
//  Created by Bowen Liang on 13-11-30.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTLoginInfo : NSObject
{
    @public NSString *email;
    @public NSString *token;
    @public NSString *displayName;
}

-(FTLoginInfo *) initWithEmail:(NSString *)aEmail withToken:(NSString *)aToken withDisplayName:(NSString *)aDisplayName;

@end
