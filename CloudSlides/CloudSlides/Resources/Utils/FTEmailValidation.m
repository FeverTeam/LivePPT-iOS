//
//  FTEmailValidation.m
//  CloudSlides
//
//  Created by Bowen Liang on 13-12-2.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import "FTEmailValidation.h"

@implementation FTEmailValidation

+ (BOOL) isEmailCorrect:(NSString *)email{
    if (!email || email.length<=3){
        return NO;
    }
    
    NSString *Regex=@"[A-Z0-9a-z._%+-]+@[A-Z0-9a-z._]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",Regex];
    return [emailTest evaluateWithObject:email];
}

@end
