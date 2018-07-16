
#import <Foundation/Foundation.h>

@interface Encrypt_MD5 : NSObject

/**
 MD5加密

 @param string 需要加密的字符串
 @return 返回加密字符串
 */
+ (NSString *)md5_encrypt:(NSString *)string;

@end
