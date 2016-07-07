

#import "UserModel.h"

@implementation UserModel

- (id)initWithLocalFile:(NSString *)fileName {
   
    self = [super init];
    if (self) {

        NSBundle *bundle = [NSBundle mainBundle];
        
        NSURL *url = [bundle URLForResource:fileName withExtension:nil];
        
        NSData *data =[NSData dataWithContentsOfURL:url];
        NSError *error;
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        NSDateFormatter *formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"dd/MM/yyyy"];
        
        NSDate *dob = [formatter dateFromString:(NSString*)dic[@"doj"]];
        
        NSDate *today = [NSDate date];
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        
        NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                                   fromDate:dob
                                                     toDate:today
                                                    options:0];
        
        NSString * str = nil;
        
        str = components.day > 0 ? [NSString stringWithFormat:@"%ld days",(long)components.day] : str;
        
        str = components.month > 0 ? [NSString stringWithFormat:@"%ld months",(long)components.month] : str;
        
        str = components.year > 0 ? [NSString stringWithFormat:@"%ld years",(long)components.year] : str;
        
        _memberSince = [str stringByAppendingString:@" ago"];
        
        _name = dic[@"name"] ? dic[@"name"] : @"";
        
    }
    return self;
}

@end
