//
//  FTJsonResult.m
//  CloudSlides
//
//  Created by Bowen Liang on 13-12-1.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import "FTResponse.h"

@implementation FTResponse

-(FTResponse *) initWithJsonObject:(id) responseObject
{
    self = [super init];
    if (self){
        NSDictionary *jsonDict = (NSDictionary *) responseObject;
        self->retcode = [[jsonDict objectForKey:@"retcode"] integerValue];
        self->data = [jsonDict objectForKey:@"data"];
        self->message = [jsonDict objectForKey:@"message"];
    }
    return self;
}

@end
