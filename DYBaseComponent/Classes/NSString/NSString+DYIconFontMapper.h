//
//  NSString+DYIconFontMapper.h
//  QEZB
//
//  Created by 李超群 on 2018/10/31.
//  Copyright © 2018 zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DYIconFontMapper)

/** 根据字符串 返回对应的iconfont 对应的 unicode 编码 */
+ (NSString *)covetToMyFontWithStr:(NSString *)origStr;

/** 返回 "LV" 对应的 unicode 编码 */
+(NSString *)covetToMyFontWithGetLv;
@end

NS_ASSUME_NONNULL_END
