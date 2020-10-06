//
//  JWTBase64Coder.h
//  Pods
//
//  Created by Lobanov Dmitry on 05.10.16.
//
//

#import <Foundation/Foundation.h>

@protocol JWTStringCoder__Protocol <NSObject>
- (NSString * _Nullable)stringWithData:(NSData * _Nonnull)data;
- (NSData * _Nullable)dataWithString:(NSString * _Nonnull)string;
@end

@interface JWTBase64Coder : NSObject <JWTStringCoder__Protocol>
+ (NSString * _Nullable)base64UrlEncodedStringWithData:(NSData * _Nonnull)data;
+ (NSData * _Nullable)dataWithBase64UrlEncodedString:(NSString * _Nonnull)urlEncodedString;
@end

//@interface JWTBase64Coder (JWTStringCoder__Protocol) <JWTStringCoder__Protocol> @end


//@interface JWTStringCoder__For__Encoding : NSObject
//@property (assign, nonatomic, readwrite) NSStringEncoding stringEncoding;
//+ (instancetype)utf8Encoding;
//@end
//@interface JWTStringCoder__For__Encoding (JWTStringCoder__Protocol) <JWTStringCoder__Protocol> @end
