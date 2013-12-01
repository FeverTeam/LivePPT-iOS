//
//  FTHMAC.h
//  CloudSlides
//
//  Created by Bowen Liang on 13-11-30.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTHMAC : NSObject

+(NSString *) hmacHex:(NSString *)string withSecret:(NSString *)secret;

@end
