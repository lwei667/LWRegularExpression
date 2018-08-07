//
//  NSString+LWRegularExpression.m
//  LWRegularExpression
//
//  Created by Liu_david on 2018/8/1.
//  Copyright © 2018年 Liu_david. All rights reserved.
//

#import "NSString+LWRegularExpression.h"
/*
 本例学习笔记来自
 iOS学习笔记之正则表达式：https://www.jianshu.com/p/1df27e7a1b6b
 iOS—正则表达式的应用：https://www.jianshu.com/p/69ad65c6a1b0
 正则表达式所有元字符及其使用方法一览表:http://c.biancheng.net/cpp/html/1427.html
*/
/*
 "^":    指出一个字符串的开始
 "$":    指出一个字符串的结束
 ".":    匹配除换行符以外的任意字符
 "|":    或
 ",":    分割
 "[ ]":  包含,默认是一个字符长度
 "[0-9]":   匹配0到9的阿拉伯数字
 "[a-z]":   匹配小写字母
 "[A-Z]":   匹配大写字母
 "[A-Za-z]":   匹配字母
 "[A-Za-z0-9]":   匹配字母数字
 "[^]":   不包含,默认是一个字符长度
 "{n}":   重复n次
 "{n,}":  重复≥n次
 "{n,m}":   重复≥n且≤m次
 "*":     重复零次或更多次
 "+":     重复一次或更多次
 "?":     重复零次或一次
 "\":     转义
 "\d":    匹配数字(\d匹配的是Unicode，要筛选各种语言里的数字字符)
 "\w":    匹配字母、数字或下划线字符
 "\s":    匹配空白字符：空格、制表符、换页符等
 "\D":    匹配非数字字符
 "\W":    匹配所有与\w不匹配的字符
 "\S":    匹配非空白字符
 "[^a-z]":   负值字符范围。匹配任何不在指定范围内的任意字符。
 
 */
@implementation NSString (LWRegularExpression)
#pragma mark -------判断相等、判断开头、判断结尾、判断包含、判断是否空字符串-------
/**
 字符串是否以str开头
 与- (BOOL)hasPrefix:(NSString *)aString功能一样

 @param str 匹配字符串
 @return 是：以str开头 否：不是以str开头
 */
- (BOOL)lw_hasPrefix:(NSString *)str{
    NSString *regex = [NSString stringWithFormat:@"^%@.*$",str];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    //BEGINSWITH: 左边以右边开头 这种是不使用正则的判断方式
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@",str];
    return [predicate evaluateWithObject:self];
}
/**
 字符串是否以str结尾
 与- (BOOL)hasSuffix:(NSString *)aString功能一样
 
 @param str 匹配字符串
 @return 是：以str结尾 否：不是以str结尾
 */
- (BOOL)lw_hasSuffix:(NSString *)str{
    NSString *regex = [NSString stringWithFormat:@"^.*%@$",str];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    //ENDSWITH 左边已右边结尾 这种是不使用正则的判断方式
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF ENDSWITH %@",str];
    return [predicate evaluateWithObject:self];
}

/**
 字符串是否相等

 @param str 匹配字符串
 @return 是 ： 相等  否：不相等
 */
- (BOOL)lw_isEqualToString:(NSString *)str{
    //同时判断开头和结尾，那么就是唯一的
    NSString *regex = [NSString stringWithFormat:@"^%@$",str];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    //ENDSWITH 左边已右边结尾 这种是不使用正则的判断方式
    return [predicate evaluateWithObject:self];
}

/**
 是否包含字符串str

 @param str 匹配字符串
 @return 是：包含 否：不包含
 */
- (BOOL)lw_containsString:(NSString *)str{
    NSString *regex = [NSString stringWithFormat:@"^.*%@.*$",str];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    //CONTAINS 包含 这种是不使用正则的判断方式
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@",str];
    return [predicate evaluateWithObject:self];
}

/**
 是否空字符串

 @return 是：空字符串 否：不是空字符串
 */
- (BOOL)lw_isBlank{
    return [[self lw_removeWhiteSpacesFromString]isEqualToString:@""];
}

/**
 是否是一个有效字符串(既不是null，也不是nil，也不是一个空字符串)

 @return 是否是一个有效字符串
 */
-(BOOL)lw_isValid
{
    return ([[self lw_removeWhiteSpacesFromString] isEqualToString:@""] || self == nil || [self isEqualToString:@"(null)"]) ? NO :YES;
}

/**
 移除空格后返回

 @return 移除空格后返回的字符串
 */
- (NSString *)lw_removeWhiteSpacesFromString
{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}


#pragma mark ------部分子字符串替换、指定开始于结束为止截取字符串、追加字符串、移除子字符串-----
/**
 字符串替换后返回新的整体字符串

 @param olderChar 原有字符串
 @param newerChar 用于替换的字符串
 @return 所有的替换完成的字符串
 */
- (NSString *)lw_replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar
{
    return  [self stringByReplacingOccurrencesOfString:olderChar withString:newerChar];
}

/**
 指定开始下标与结束下标截取字符串

 @param begin 开始的下标
 @param end 结束的下标
 @return 截取出来的字符串
 */
- (NSString*)lw_getSubstringFrom:(NSInteger)begin to:(NSInteger)end
{
    NSRange r;
    r.location = begin;
    r.length = end - begin;
    return [self substringWithRange:r];
}

/**
 根据追加的字符串，返回一个新的字符串

 @param string 追加字符串
 @return 追加后的字符串
 */
- (NSString *)lw_addString:(NSString *)string
{
    if(!string || string.length == 0)
        return self;
    
    return [self stringByAppendingString:string];
}

/**
 移除字符串

 @param subString 要移除的子字符串
 @return 移除子字符串后的字符串
 */
-(NSString *)lw_removeSubString:(NSString *)subString
{
    if ([self containsString:subString])
    {
        NSRange range = [self rangeOfString:subString];
        return  [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}
#pragma mark ----判断字符串组成，是否都是大写字母、是否都是小写字母、是否都是字母，是否都是数字、是否首位为0，是否首位是0并后面是数字，是否首位是0后面是字母或数字--
/**
 字符串是否都由大写字母组成

 @return 是：都由大写字母组成，否：有不是大写字母的字符
 */
- (BOOL)lw_isContainsOnlyUppercaseLetters{
    NSString *regex = @"^[A-Z]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

/**
 字符串是否都由小写字母组成
 
 @return 是：都由小写字母组成，否：有不是小写字母的字符
 */
- (BOOL)lw_isContainsOnlyLowerLetters{
    NSString *regex = @"^[a-z]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}


/**
 字符串是否都由字母组成
 
 @return 是：都由字母组成，否：有不是字母的字符
 */
- (BOOL)lw_isContainsOnlyLetters{
    NSString *regex = @"^[A-Za-z]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}


/**
 是否仅仅为数字组成

 @return 是：都由数字组成  否：有不少数字的字符
 */
- (BOOL)lw_isContainsOnlyNumbers{
    NSString *regex = @"^[0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}
/**
 是否仅仅为字母和数字组成
 
 @return 是：仅仅为字母和数字组成  否：有不是字母或数字的字符
 */
- (BOOL)lw_isContainsOnlyLettersOrNumbers{
    NSString *regex = @"^[A-Za-z0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}
/**
 是否仅仅是中文
 
 @return 是否仅仅是中文
 */
- (BOOL)lw_isContainsOnlyChineseCharacter {
    NSString *regex = @"^[\\u4E00-\\u9FEA]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

/**
 前面是否以0开头
 
 @return 是：前面是以0开头 否：前面不是0开头
 */
- (BOOL)lw_theFrontIsZero{
    NSString *regex = @"^0+.*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}
/**
 前面是否以0开头，后面数字
 
 @return 是：前面是以0开头且后面是数字 否：前面不是0开头或后面不是数字
 */
- (BOOL)lw_theFrontIsZeroAndTheFollowingAreNumbers{
    NSString *regex = @"^0+[0-9]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

/**
 前面是否以0开头，后面是字母或数字
 
 @return 是：前面是以0开头且后面是字母或数字 否：前面不是0开头或后面不是字母或数字
 */
- (BOOL)lw_theFrontIsZeroAndTheFollowingAreLettersOrNumbers{
    NSString *regex = @"^0+[A-Za-z0-9]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

#pragma mark ------------字符串数组连接为字符串、字符串分割为字符串数组————————————
/**
 将字符串数组使用joinString连接起来，组成一个字符串

 @param array 字符串数组
 @param joinString 连接字符串
 @return 组合后的字符串
 */
+ (NSString *)getStringFromArray:(NSArray <NSString *>*)array joinString:(NSString *)joinString
{
    return [array componentsJoinedByString:joinString];
}

/**
 将自身使用分割字符串分隔为字符串数组

 @param separateString 分割字符串
 @return 分割后得到的字符串数组
 */
- (NSArray <NSString *>*)getArrayWithSeparateString:(NSString *)separateString
{
    return [self componentsSeparatedByString:separateString];
}

#pragma mark -----获取app版本号、名称等-------
/**
 获取App的发布版本号

 @return App的发布版本号
 */
+ (NSString *)lw_getMyApplicationReleaseVersion
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *shortVersion = [info objectForKey:@"CFBundleShortVersionString"];
    return shortVersion;
}
/**
 获取App的build版本号
 
 @return App的build版本号
 */
+ (NSString *)lw_getMyApplicationBuildVersion
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleVersion = [info objectForKey:@"CFBundleVersion"];
    return bundleVersion;
}

/**
 获取App的名称

 @return App的名称
 */
+ (NSString *)lw_getMyApplicationName
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleDisplayName"];
    return name;
}


#pragma mark -------NSString 与 NSData的互转--------
/**
 Convert string to NSData

 @return 转化的二进制数据
 */
- (NSData *)lw_convertToData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

/**
 Get String from NSData

 @param data 二进制数据
 @return 转化的字符串
 */
+ (NSString *)lw_getStringFromData:(NSData *)data
{
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
}


#pragma mark ----------判断是否邮箱、手机号、URL、座机号-------

/**
 Is Valid Email

 @return 是否有效邮箱号
 */
- (BOOL)lw_isValidEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}



/**
 Is Valid Phone

 @return 是否有效手机号
 */
- (BOOL)lw_isVAlidPhoneNumber
{
    /*
     支持手机号段:
     移动：139   138   137   136   135   134   147   150   151   152   157   158    159   178  182   183   184   187   188
     联通： 130   131   132   155   156   185   186   145   176
     电信： 133   153   177   180   181   189
     */
    NSString *regex = @"^0?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}



/**
 Is Valid URL

 @return 是否有效URL
 */
- (BOOL)lw_isValidUrl
{
    NSString *regex =@"[a-zA-z]+://[^\\s]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

/**
 验证座机号码

 @return 是否有效座机号
 */
-(BOOL)lw_isValidLandlinePhone
{
    NSString *phoneRegex = @"^((0\\d{2,3})-?)(\\d{7,8})(-(\\d{3,}))?$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [predicate evaluateWithObject:self];
}

/**
 验证身份证 15位或18位

 @return 是否有效身份证
 */
- (BOOL)lw_isValidIdCard
{
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:self];
}

/**
 判断用户名，规则为：首位为字母，整体长度有一个限制，[minLength,maxLength]之间

 @param minLength 最小长度
 @param maxLength 最大程度
 @return 是否正确的用户名
 */
- (BOOL)lw_isValidUserAccountWithMinLength:(NSUInteger)minLength MaxLength:(NSUInteger)maxLength{
    NSString *pattern = [NSString stringWithFormat:@"^[A-Za-z]\\w{%lu,%lu}",(unsigned long)(minLength-1),(unsigned long)(maxLength-1)];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:self];
}


/**
 是否有效邮政编码
 
 @return 是否有效邮政编码
 */
- (BOOL)lw_isValidPostcode
{
    NSString *pattern = @"(^[1-9][0-9]{5}$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:self];
}











@end
