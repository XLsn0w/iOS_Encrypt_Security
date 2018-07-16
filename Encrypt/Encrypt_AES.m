
#import "Encrypt_AES.h"
#import <CommonCrypto/CommonCryptor.h>

//偏移量

/**
 偏移量
 ECB模式下IV无限制
 CBC模式下128对应16字节,192对应24字节,256对应32字节
 */
#define DES_IV             @""

@implementation Encrypt_AES

+ (NSString *)AES128EncryptString:(NSString *)string key:(NSString *)key {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //kCCKeySizeAES128是加密位数 可以替换成256位的
    // 为结束符'\0' +1
    char keyPtr[kCCKeySizeAES128 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    //偏移量
    const void *vinitVec = (DES_IV.length > 0) ? (const void *) [DES_IV UTF8String] : nil;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          vinitVec,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *backData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        NSData *baseData = [backData base64EncodedDataWithOptions:0];
        NSString *result = [[NSString alloc] initWithData:baseData encoding:NSUTF8StringEncoding];
        return result;
    }
    free(buffer);
    return nil;
}
+ (NSString *)AES128DecryptString:(NSString *)string key:(NSString *)key {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    char keyPtr[kCCKeySizeAES128 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    //偏移量
    const void *vinitVec = (DES_IV.length > 0) ? (const void *) [DES_IV UTF8String] : nil;

    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          vinitVec,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *backData = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        NSString *result = [[NSString alloc] initWithData:backData encoding:NSUTF8StringEncoding];
        return result;
    }
    free(buffer);
    return nil;
}
@end
