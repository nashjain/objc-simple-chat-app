//
//  UserModel.m
//  ChatApp
//
//  Created by Rohit Talwar on 07/07/16.
//  Copyright © 2016 John Talwar. All rights reserved.
//

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
        
        NSDate *dob = [formatter dateFromString:(NSString*)dic[@"dob"]];
        
        NSDate *today = [NSDate date];
        
//        NSTimeInterval dateDiff = [today timeIntervalSinceDate:dob];
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        

        
        NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                                   fromDate:dob
                                                     toDate:today
                                                    options:0];
        
        _age = components.year;
        
        _name = dic[@"name"] ? dic[@"name"] : @"";
        
        
//        NSNumber *ageFromDic = (NSNumber*)dic[@"age"] ;
//        _age = ageFromDic ? [ageFromDic intValue] : 0;
        
        
    }
    return self;
}

@end
