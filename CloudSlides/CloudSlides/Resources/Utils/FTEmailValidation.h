//
//  FTEmailValidation.h
//  CloudSlides
//
//  Created by Bowen Liang on 13-12-2.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTEmailValidation : NSObject

//检查email格式是否正确
+ (BOOL) isEmailCorrect:(NSString *)email;

@end
