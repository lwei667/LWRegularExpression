//
//  ViewController.m
//  LWRegularExpression
//
//  Created by Liu_david on 2018/8/1.
//  Copyright © 2018年 Liu_david. All rights reserved.
//

#import "ViewController.h"
#import "NSString+LWRegularExpression.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self demo0];
    
}
- (void)demo0{
    NSString *str1 = @"abc123";
    NSLog(@"%@ %@ prefix %@",str1,[str1 lw_hasPrefix:@"abc"]?@"has":@"dot have",@"abc");
    NSLog(@"%@ %@ suffix %@",str1,[str1 lw_hasSuffix:@"123"]?@"has":@"dot have",@"123");
    NSLog(@"%@ %@ equal to string %@",str1,[str1 lw_isEqualToString:@"abc123"]?@"is":@"is not",@"abc123");
    NSLog(@"%@ %@ %@",str1,[str1 lw_containsString:@"c12"]?@"contains":@"don't contain",@"c12");
    
    NSLog(@"-------");
    
    NSString *str2 = @"ABC";
    NSString *str3 = @"AbC";
    NSString *str4 = @"abc";
    NSLog(@"%@ %@ only UpperLetters",str2,[str2 lw_isContainsOnlyUppercaseLetters]?@"contains":@"is not contain");
    NSLog(@"%@ %@ only UpperLetters",str3,[str3 lw_isContainsOnlyUppercaseLetters]?@"contains":@"is not contain");
    NSLog(@"%@ %@ only UpperLetters",str4,[str4 lw_isContainsOnlyUppercaseLetters]?@"contains":@"is not contain");
    
    NSLog(@"-------");
    
    NSLog(@"%@ %@ only lowerLetters",str2,[str2 lw_isContainsOnlyLowerLetters]?@"contains":@"is not contain");
    NSLog(@"%@ %@ only lowerLetters",str3,[str3 lw_isContainsOnlyLowerLetters]?@"contains":@"is not contain");
    NSLog(@"%@ %@ only lowerLetters",str4,[str4 lw_isContainsOnlyLowerLetters]?@"contains":@"is not contain");
    
    NSLog(@"-------");
    
    NSLog(@"%@ %@ only letters",str1,[str1 lw_isContainsOnlyLetters]?@"contains":@"is not contain");
    NSLog(@"%@ %@ only letters",str3,[str3 lw_isContainsOnlyLetters]?@"contains":@"is not contain");
    
    NSLog(@"-------");
    
    NSString *str5 = @"123";
    NSString *str6 = @"0013";
    
    NSLog(@"%@ %@ only numbers",str1,[str1 lw_isContainsOnlyNumbers]?@"contains":@"is not contain");
    NSLog(@"%@ %@ only numbers",str5,[str5 lw_isContainsOnlyNumbers]?@"contains":@"is not contain");
    
    NSLog(@"-------");
    
    NSLog(@"The front of %@ %@ zero",str5,[str5 lw_theFrontIsZero]?@"is":@"is not");
    NSLog(@"The front of %@ %@ zero",str6,[str6 lw_theFrontIsZero]?@"is":@"is not");
    
    NSLog(@"-------");
    
    

}




@end
