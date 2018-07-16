

#import "Encrypt_RSA.h"
#import <Security/Security.h>
#import <CommonCrypto/CommonDigest.h>
#import "RSAOC.h"

@interface Encrypt_RSA()

@end
@implementation Encrypt_RSA 
+ (NSString *)rsaEncryptString:(NSString *)str publicKey:(NSString *)pubKey {
    return [RSAOC encryptString:str publicKey:pubKey];
}

+ (NSString *)rsaDecryptString:(NSString *)str privateKey:(NSString *)privKey {
    return [RSAOC decryptString:str privateKey:privKey];
}
+ (NSString *)signString:(NSString *)str privateKey:(NSString *)privKey {
    return [RSAOC signString:str withPrivatekey:privKey];
}

+ (BOOL)verifyString:(NSString *)str sign:(NSString *)sign pubKey:(NSString *)pubKey {
    return [RSAOC verifyString:str sign:sign pubKey:pubKey];
}


- (NSString*)formatRSAKeyWithKeyString:(NSString*)keyString andKeytype:(NSInteger)type
{
    NSInteger lineNum = -1;
    NSMutableString *result = [NSMutableString string];

    if (type == 1) {
        [result appendString:@"-----BEGIN PRIVATE KEY-----\n"];
        lineNum = 79;
    } else if (type == 0) {
        [result appendString:@"-----BEGIN PUBLIC KEY-----\n"];
        lineNum = 76;
    }

    int count = 0;
    for (int i = 0; i < [keyString length]; ++i) {
        unichar c = [keyString characterAtIndex:i];
        if (c == '\n' || c == '\r') {
            continue;
        }
        [result appendFormat:@"%c", c];
        if (++count == lineNum) {
            [result appendString:@"\n"];
            count = 0;
        }
    }
    if (type == 1) {
        [result appendString:@"\n-----END PRIVATE KEY-----"];

    }else if(type == 0){
        [result appendString:@"\n-----END PUBLIC KEY-----"];
    }
    return result;

}
@end
