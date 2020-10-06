//
//  JWTBase64Coder.m
//  Pods
//
//  Created by Lobanov Dmitry on 05.10.16.
//
//

#import "JWTBase64Coder.h"

@implementation JWTBase64Coder

+ (NSString *)base64UrlEncodedStringFromBase64String:(NSString *)base64String {
    NSString *s = base64String;
    s = [s stringByReplacingOccurrencesOfString:@"=" withString:@""];
    s = [s stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    s = [s stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    return s;
}

+ (NSString *)base64UrlEncodedStringWithData:(NSData *)data {
    if (!data) {
        return nil;
    }
    NSData *b64 = [data base64EncodedDataWithOptions:0];
    NSString *b64string = b64 ? [[NSString alloc] initWithData:b64 encoding:NSUTF8StringEncoding] : nil;
    if (!b64string) {
        return nil;;
    }
    return [JWTBase64Coder base64UrlEncodedStringFromBase64String:b64string];
}

+ (NSString *)base64StringFromBase64UrlEncodedString:(NSString *)base64UrlEncodedString {
    NSString *s = base64UrlEncodedString;
    s = [s stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    s = [s stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    switch (s.length % 4) {
        case 2:
            s = [s stringByAppendingString:@"=="];
            break;
        case 3:
            s = [s stringByAppendingString:@"="];
            break;
        default:
            break;
    }
    return s;
}

+ (NSData *)dataWithBase64UrlEncodedString:(NSString *)urlEncodedString {
    if (!urlEncodedString) {
        return nil;
    }
    NSString *b64 = [JWTBase64Coder base64StringFromBase64UrlEncodedString:urlEncodedString];
    return [[NSData alloc] initWithBase64EncodedString:b64 options:0];
}

- (NSString *)stringWithData:(NSData *)data {
    return [JWTBase64Coder base64UrlEncodedStringWithData:data];
}

- (NSData *)dataWithString:(NSString *)string {
    return [JWTBase64Coder dataWithBase64UrlEncodedString:string];
}

@end
