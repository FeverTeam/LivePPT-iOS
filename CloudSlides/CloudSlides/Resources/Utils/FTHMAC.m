//
//  FTHMAC.m
//  CloudSlides
//
//  Created by Bowen Liang on 13-11-30.
//  Copyright (c) 2013年 Fever Team. All rights reserved.
//

#import "FTHMAC.h"

#import "CommonCrypto/CommonHMAC.h"

@implementation FTHMAC

+(NSString *) hmacHex:(NSString *)string withSecret:(NSString *)secret
{
    if (!string || !secret) {
        return nil;
    }
    
    //HAMC
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSData *secretData = [secret dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *signatureData = [NSMutableData dataWithLength:CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, secretData.bytes, secretData.length, stringData.bytes, stringData.length, signatureData.mutableBytes);
    
    //转成16进制字符串并去除多余符号
    NSString *hexStr = [[NSString alloc] initWithString:signatureData.description];
    hexStr = [hexStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    hexStr = [hexStr stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hexStr = [hexStr stringByReplacingOccurrencesOfString:@">" withString:@""];
    
    return hexStr;
}

@end
