//
//  NSDate+Utils.h
//  DYZB
//
//  Created by houjihu on 15/10/13.
//  Copyright © 2015年 mydouyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

/**
 *	判断两个日期是否是同一天
 *
 *	@param date1	输入的日期
 *	@param date2	输入的日期
 *
 *	@return 如果是，则返回YES
 */
+ (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2;

/**
 *	比较两个日期相隔多少天
 *
 *	@param earlyDate	较早的日期
 *	@param lateDate     较晚的日期
 *	@param days			相隔的天数
 *
 *	@return 0：正好相隔days天；-1：相隔不到days天 / lateDate日期比earlyDate还早；1：相隔多于days天
 */
+ (BOOL)isDate:(NSDate *)earlyDate earlyThanDate:(NSDate *)lateDate forDays:(NSInteger)days;

/**
 *	判断两个日期是否处于同一年
 *
 *	@param earlyDate	日期
 *	@param lateDate     日期
 *
 *	@return YES:是；NO:否
 */
+ (BOOL)isSameYearForDate:(NSDate *)earlyDate AndDate:(NSDate *)lateDate;


/**
 *  比较两个日期
 *
 *  @param oneDay     <#oneDay description#>
 *  @param anotherDay <#anotherDay description#>
 *
 *  @return <#return value description#>
 */
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

/**
 *  比较两个日期
 *
 *  @param oneDay     <#oneDay description#>
 *  @param anotherDay <#anotherDay description#>
 *
 *  @return <#return value description#>
 */
+(NSString *)compareDate:(NSDate *)date;


/**
 昨天今天和明天

 @param date <#date description#>

 @return <#return value description#>
 */
+(NSString *)compareDate2:(NSDate *)date;

/**
 将NSString转化为NSDate

 @param uiDate 字符串date 形式： yyyy-MM-dd
 @return 转化的NSDate
 */
+ (NSDate *)convertDateFromString:(NSString*)uiDate;

//日期转换成今天明天后天
+ (NSString *)compareDateWithTimeInterval:(NSTimeInterval)timeInterval;

@end
