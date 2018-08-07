//
//  NSString+LWRegularExpression.h
//  LWRegularExpression
//
//  Created by Liu_david on 2018/8/1.
//  Copyright © 2018年 Liu_david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LWRegularExpression)



#pragma mark -------判断相等、判断开头、判断结尾、判断包含、判断是否空字符串-------
/**
 字符串是否以str开头
 与- (BOOL)hasPrefix:(NSString *)aString功能一样
 
 @param str 匹配字符串
 @return 是：以str开头 否：不是以str开头
 */
- (BOOL)lw_hasPrefix:(NSString *)str;
/**
 字符串是否以str结尾
 与- (BOOL)hasSuffix:(NSString *)aString功能一样
 
 @param str 匹配字符串
 @return 是：以str结尾 否：不是以str结尾
 */
- (BOOL)lw_hasSuffix:(NSString *)str;

/**
 字符串是否相等
 
 @param str 匹配字符串
 @return 是 ： 相等  否：不相等
 */
- (BOOL)lw_isEqualToString:(NSString *)str;
/**
 是否包含字符串str
 
 @param str 匹配字符串
 @return 是：包含 否：不包含
 */
- (BOOL)lw_containsString:(NSString *)str;
/**
 是否空字符串
 
 @return 是：空字符串 否：不是空字符串
 */
- (BOOL)lw_isBlank;
/**
 是否是一个有效字符串(既不是null，也不是nil，也不是一个空字符串)
 
 @return 是否是一个有效字符串
 */
-(BOOL)lw_isValid;
/**
 移除空格后返回
 
 @return 移除空格后返回的字符串
 */
- (NSString *)lw_removeWhiteSpacesFromString;




#pragma mark ------部分子字符串替换、指定开始于结束为止截取字符串、追加字符串、移除子字符串-----
/**
 字符串替换后返回新的整体字符串
 
 @param olderChar 原有字符串
 @param newerChar 用于替换的字符串
 @return 所有的替换完成的字符串
 */
- (NSString *)lw_replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;
/**
 指定开始下标与结束下标截取字符串
 
 @param begin 开始的下标
 @param end 结束的下标
 @return 截取出来的字符串
 */
- (NSString*)lw_getSubstringFrom:(NSInteger)begin to:(NSInteger)end;
/**
 根据追加的字符串，返回一个新的字符串
 
 @param string 追加字符串
 @return 追加后的字符串
 */
- (NSString *)lw_addString:(NSString *)string;
/**
 移除字符串
 
 @param subString 要移除的子字符串
 @return 移除子字符串后的字符串
 */
-(NSString *)lw_removeSubString:(NSString *)subString;




#pragma mark ----判断字符串组成，是否都是大写字母、是否都是小写字母、是否都是字母，是否都是数字、是否都是中文、是否首位为0，是否首位是0并后面是数字，是否首位是0后面是字母或数字--
/**
 字符串是否都由大写字母组成
 
 @return 是：都由大写字母组成，否：有不是大写字母的字符
 */
- (BOOL)lw_isContainsOnlyUppercaseLetters;
/**
 字符串是否都由小写字母组成
 
 @return 是：都由小写字母组成，否：有不是小写字母的字符
 */
- (BOOL)lw_isContainsOnlyLowerLetters;
/**
 字符串是否都由字母组成
 
 @return 是：都由字母组成，否：有不是字母的字符
 */
- (BOOL)lw_isContainsOnlyLetters;
/**
 是否仅仅为数字组成
 
 @return 是：都由数字组成  否：有不少数字的字符
 */
- (BOOL)lw_isContainsOnlyNumbers;
/**
 是否仅仅为字母和数字组成
 
 @return 是：仅仅为字母和数字组成  否：有不是字母或数字的字符
 */
- (BOOL)lw_isContainsOnlyLettersOrNumbers;
/**
 是否仅仅是中文
 
 @return 是否仅仅是中文
 */
- (BOOL)lw_isContainsOnlyChineseCharacter;
/**
 前面是否以0开头
 
 @return 是：前面是以0开头 否：前面不是0开头
 */
- (BOOL)lw_theFrontIsZero;
/**
 前面是否以0开头，后面数字
 
 @return 是：前面是以0开头且后面是数字 否：前面不是0开头或后面不是数字
 */
- (BOOL)lw_theFrontIsZeroAndTheFollowingAreNumbers;
/**
 前面是否以0开头，后面是字母或数字
 
 @return 是：前面是以0开头且后面是字母或数字 否：前面不是0开头或后面不是字母或数字
 */
- (BOOL)lw_theFrontIsZeroAndTheFollowingAreLettersOrNumbers;



#pragma mark ------------字符串数组连接为字符串、字符串分割为字符串数组————————————
/**
 将字符串数组使用joinString连接起来，组成一个字符串
 
 @param array 字符串数组
 @param joinString 连接字符串
 @return 组合后的字符串
 */
+ (NSString *)getStringFromArray:(NSArray <NSString *>*)array joinString:(NSString *)joinString;
/**
 将自身使用分割字符串分隔为字符串数组
 
 @param separateString 分割字符串
 @return 分割后得到的字符串数组
 */
- (NSArray <NSString *>*)getArrayWithSeparateString:(NSString *)separateString;



#pragma mark -----获取app版本号、名称等-------
/**
 获取App的发布版本号
 
 @return App的发布版本号
 */
+ (NSString *)lw_getMyApplicationReleaseVersion;
/**
 获取App的build版本号
 
 @return App的build版本号
 */
+ (NSString *)lw_getMyApplicationBuildVersion;
/**
 获取App的名称
 
 @return App的名称
 */
+ (NSString *)lw_getMyApplicationName;



#pragma mark -------NSString 与 NSData的互转--------
/**
 Convert string to NSData
 
 @return 转化的二进制数据
 */
- (NSData *)lw_convertToData;
/**
 Get String from NSData
 
 @param data 二进制数据
 @return 转化的字符串
 */
+ (NSString *)lw_getStringFromData:(NSData *)data;




#pragma mark ----------判断是否邮箱、手机号、URL、座机号-------

/**
 Is Valid Email
 
 @return 是否有效邮箱号
 */
- (BOOL)lw_isValidEmail;
/**
 Is Valid Phone
 
 @return 是否有效手机号
 */
- (BOOL)lw_isVAlidPhoneNumber;
/**
 Is Valid URL
 
 @return 是否有效URL
 */
- (BOOL)lw_isValidUrl;
/**
 验证座机号码
 
 @return 是否有效座机号
 */
-(BOOL)lw_isValidLandlinePhone;
/**
 验证身份证 15位或18位
 
 @return 是否有效身份证
 */
- (BOOL)lw_isValidIdCard;

/**
 判断用户名，规则为：首位为字母，整体长度有一个限制，[minLength,maxLength]之间
 
 @param minLength 最小长度
 @param maxLength 最大程度
 @return 是否正确的用户名
 */
- (BOOL)lw_isValidUserAccountWithMinLength:(NSUInteger)minLength MaxLength:(NSUInteger)maxLength;
/**
 是否有效邮政编码
 
 @return 是否有效邮政编码
 */
- (BOOL)lw_isValidPostcode;




@end
