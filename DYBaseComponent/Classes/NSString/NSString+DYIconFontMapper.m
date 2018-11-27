//
//  NSString+DYIconFontMapper.m
//  QEZB
//
//  Created by 李超群 on 2018/10/31.
//  Copyright © 2018 zhou. All rights reserved.
//

#import "NSString+DYIconFontMapper.h"

@implementation NSString (DYIconFontMapper)

/** 根据字符串 返回对应的iconfont 对应的 unicode 编码 */
+ (NSString *)covetToMyFontWithStr:(NSString *)origStr{
    NSMutableString *destStr = [NSMutableString string];
    NSDictionary *mapper = @{
                             @"0" : @"\U0000E62F",
                             @"1" : @"\U0000E62D",
                             @"2" : @"\U0000E62E",
                             @"3" : @"\U0000E631",
                             @"4" : @"\U0000E630",
                             @"5" : @"\U0000E632",
                             @"6" : @"\U0000E634",
                             @"7" : @"\U0000E633",
                             @"8" : @"\U0000E635",
                             @"9" : @"\U0000E636",
                             };
    
    for (int i = 0; i < origStr.length; i++) {
        NSString *tempStr = (NSString *)mapper[[origStr substringWithRange:NSMakeRange(i, 1)]];
        [destStr appendString:tempStr];
    }
    return destStr;
}

/** 返回 "LV" 对应的 unicode 编码 */
+(NSString *)covetToMyFontWithGetLv{
    return @"\U0000E637";
}
@end
