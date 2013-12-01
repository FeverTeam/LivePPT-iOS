//
//  FTJsonResult.h
//  CloudSlides
//
//  Created by Bowen Liang on 13-12-1.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTResponse : NSObject
{
    @public NSString *message;
    @public NSInteger retcode;
    @public id data;
}

-(FTResponse *) initWithJsonObject:(id) json;

@end
