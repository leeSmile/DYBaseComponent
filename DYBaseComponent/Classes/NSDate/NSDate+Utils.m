//
//  NSDate+Utils.m
//  DYZB
//
//  Created by houjihu on 15/10/13.
//  Copyright © 2015年 mydouyu. All rights reserved.
//

#import "NSDate+Utils.h"

@implementation NSDate (Utils)

+ (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2
{
    if (!date1 || !date2) {
        return NO;
    }
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    return ([comp1 day] == [comp2 day] && [comp1 month] == [comp2 month] && [comp1 year] == [comp2 year]);
}

+ (BOOL)isDate:(NSDate *)earlyDate earlyThanDate:(NSDate *)lateDate forDays:(NSInteger)days{
    BOOL result = NO;
    
    NSDate *yesterdayOfLateDate = [lateDate dateByAddingTimeInterval:days * (-86400.0)]; // 24小时=86400秒=24*60*60秒
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *earlyDateComponent = [calendar components:unitFlags fromDate:earlyDate];
    NSDateComponents *yesterdayOfLateDateComponent = [calendar components:unitFlags fromDate:yesterdayOfLateDate];
    
    NSInteger earlyDateYear = [earlyDateComponent year];
    NSInteger earlyDateMonth = [earlyDateComponent month];
    NSInteger earlyDateDay = [earlyDateComponent day];
    NSInteger yesterdayOfLateDateYear = [yesterdayOfLateDateComponent year];
    NSInteger yesterdayOfLateDateMonth = [yesterdayOfLateDateComponent month];
    NSInteger yesterdayOfLateDateDay = [yesterdayOfLateDateComponent day];
    
    if (earlyDateYear == yesterdayOfLateDateYear && earlyDateMonth == yesterdayOfLateDateMonth && earlyDateDay == yesterdayOfLateDateDay) {
        result = YES;
    } else {
        result = NO;
    }
    return result;
}

+ (BOOL)isSameYearForDate:(NSDate *)earlyDate AndDate:(NSDate *)lateDate{
    BOOL isSameYear = NO;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *earlyDateComponent = [calendar components:unitFlags fromDate:earlyDate];
    NSDateComponents *lateDateComponent = [calendar components:unitFlags fromDate:lateDate];
    
    NSInteger earlyDateYear = [earlyDateComponent year];
    NSInteger lateDateYear = [lateDateComponent year];
    
    if (earlyDateYear == lateDateYear) {
        isSameYear = YES;
    } else {
        isSameYear = NO;
    }
    return isSameYear;
}

+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
    
}

//日期转换成今天明天
+(NSString *)compareDate:(NSDate *)date{
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    
    NSDate *orginToday = [[NSDate alloc] init];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSTimeInterval interval = [zone secondsFromGMTForDate:orginToday];
    NSDate *today = [orginToday dateByAddingTimeInterval:interval];
    NSDate *tomorrow, *yesterday;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [dateFormatter setDateFormat:@"MM月dd日"];    
    NSString *destDateString = [dateFormatter stringFromDate:date];

    if ([dateString isEqualToString:todayString])
    {
        return @"今天";
    }else if ([dateString isEqualToString:tomorrowString])
    {
        return @"明天";
    }
    else
    {
        return destDateString;
    }
}

+(NSString *)compareDate2:(NSDate *)date{
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *tomorrow, *yesterday;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [dateFormatter setDateFormat:@"MM月dd日 HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    
    if ([dateString isEqualToString:todayString])
    {
        return [NSString stringWithFormat:@"今天 %@", [dateFormatter stringFromDate:date]];
    } else if ([dateString isEqualToString:yesterdayString])
    {
        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:date]];
    }else if ([dateString isEqualToString:tomorrowString])
    {
        
        return [NSString stringWithFormat:@"明天 %@", [dateFormatter stringFromDate:date]];
    }
    else
    {
        return destDateString;
    }
}

+ (NSDate *)convertDateFromString:(NSString*)uiDate {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSDate *date = [dateFormatter dateFromString:uiDate];
    return date;
}

//日期转换成今天明天后天
+ (NSString *)compareDateWithTimeInterval:(NSTimeInterval)timeInterval {
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [NSDate date];
    NSDate *tomorrow,*dayAfterTomorrow;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    dayAfterTomorrow = [tomorrow dateByAddingTimeInterval:secondsPerDay];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    NSString * dayAfterTomorrowString = [[dayAfterTomorrow description] substringToIndex:10];
    NSString * dateString = [[date description] substringToIndex:10];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd日HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    NSString *onlyTime = [destDateString substringFromIndex:3];
    
    if ([dateString isEqualToString:todayString])
    {
        return [NSString stringWithFormat:@"今天%@",onlyTime];
    }
    else if ([dateString isEqualToString:tomorrowString])
    {
        return [NSString stringWithFormat:@"明天%@",onlyTime];
    }
    else if ([dateString isEqualToString:dayAfterTomorrowString])
    {
        return [NSString stringWithFormat:@"后天%@",onlyTime];
    }
    else
    {
        return destDateString;
    }
}


@end
