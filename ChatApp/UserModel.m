

#import "UserModel.h"

@implementation UserModel

-(id)initWithJSONString:(NSString*)json{
    
    self = [super init];
    if (self) {

    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    
        data = data ? data : [@"{}" dataUsingEncoding:NSUTF8StringEncoding];
        
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
        
        NSString * str = @"a while";
        
        str = components.day > 0 ? [NSString stringWithFormat:@"%ld days",(long)components.day] : str;
        
        str = components.month > 0 ? [NSString stringWithFormat:@"%ld months",(long)components.month] : str;
        
        str = components.year > 0 ? [NSString stringWithFormat:@"%ld years",(long)components.year] : str;
        
        _memberSince = [str stringByAppendingString:@" ago"];
        
        _name = dic[@"name"] ? dic[@"name"] : @"";
       
        
    }
    return self;
    
}
- (id)initWithLocalFile:(NSString *)fileName {
   
        NSBundle *bundle = [NSBundle mainBundle];
        
        NSURL *url = [bundle URLForResource:fileName withExtension:nil];
        
        NSData *data =[NSData dataWithContentsOfURL:url];
    
    
        NSString *jsonFromData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return [self initWithJSONString:jsonFromData];
}

@end
