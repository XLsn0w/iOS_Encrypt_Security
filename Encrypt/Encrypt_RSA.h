

#import <Foundation/Foundation.h>

@interface Encrypt_RSA : NSObject

/**
 *  rsa加密
 *
 *  @param str    要加密的明文
 *  @param pubKey 加密公钥
 *
 *  @return 加密之后的密文
 */
+ (NSString *)rsaEncryptString:(NSString *)str publicKey:(NSString *)pubKey;
/**
 *  rsa解密
 *
 *  @param str     密文
 *  @param privKey 密钥
 *
 *  @return 明文
 */
+ (NSString *)rsaDecryptString:(NSString *)str privateKey:(NSString *)privKey;

/**
 签名

 @param str 要签名的明文
 @param privKey 私钥
 @return 签名后
 */
+ (NSString *)signString:(NSString *)str privateKey:(NSString *)privKey;


/**
 验签

 @param str 需要验证的字符
 @param sign 验证签名需要的签名后的key
 @param pubKey 公钥
 @return 结果
 */
+ (BOOL)verifyString:(NSString *)str sign:(NSString *)sign pubKey:(NSString *)pubKey;


@end
