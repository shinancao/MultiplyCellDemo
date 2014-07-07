//
//  NSDate+convenience.h
//
//  Created by in 't Veen Tjeerd on 4/23/12.
//  Copyright (c) 2012 Vurig Media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Convenience)

-(NSDate *)offsetMonth:(int)numMonths;
-(NSDate *)offsetDay:(int)numDays;
-(NSDate *)offsetHours:(int)hours;
-(NSInteger)numDaysInMonth;
-(NSInteger)firstWeekDayInMonth;
- (NSInteger)weekDay;
-(NSInteger)year;
-(NSInteger)month;
-(NSInteger)day;
- (NSInteger)hour;
- (NSInteger)minute;

+(NSDate *)dateStartOfDay:(NSDate *)date;
+(NSDate *)dateStartOfWeek;
+(NSDate *)dateEndOfWeek;

/**
 得到指定月份的第一天或最后一天
 @param isFirst YES计算第一天  NO计算最后一天
 @return yyyy-MM-dd形式的字符串
 **/
- (NSString *)getFirstDayOrLastDay:(BOOL)isFirst;

+ (NSDate*)parseDate:(NSString*)inStrDate format:(NSString*)inFormat;

+ (NSString*)parseString:(NSDate*)inDate format:(NSString*)inFormat;
@end
