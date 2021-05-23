#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber > 0 && monthNumber <= 12) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:monthNumber - 1];
        
        return monthName;
    }
    
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[dateFormatter dateFromString:date]];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];

    NSInteger dayNumber = [calendar component:NSCalendarUnitWeekday fromDate:date];

    if (dayNumber) {
        return [[dateFormatter shortWeekdaySymbols] objectAtIndex:dayNumber - 1];
    }
    
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *currentDateComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:[NSDate now]];
    NSDateComponents *givenDateComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:date];

    if (currentDateComponents.year == givenDateComponents.year) {
        return currentDateComponents.weekOfYear == givenDateComponents.weekOfYear;
    }
    
    return NO;
}

@end
