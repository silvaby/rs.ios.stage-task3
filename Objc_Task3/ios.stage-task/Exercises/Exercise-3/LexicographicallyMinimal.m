#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSString *stringOne = [[NSString alloc] initWithString: string1];
    NSString *stringTwo = [[NSString alloc] initWithString: string2];
    NSMutableString *result = [[NSMutableString alloc] init];

    while ([stringOne length] && [stringTwo length]) {
        const char *one = [stringOne UTF8String];
        const char *two = [stringTwo UTF8String];
        
        if (one[0] < two[0] || one[0] == two[0]) {
            [result appendString: [stringOne substringToIndex: 1]];
            stringOne = [stringOne substringFromIndex: 1];
        } else {
            [result appendString: [stringTwo substringToIndex: 1]];
            stringTwo = [stringTwo substringFromIndex: 1];
        }
    }
    
    [stringOne length] ? [result appendString: stringOne] : [result appendString: stringTwo];
    
    return result;
}

@end
