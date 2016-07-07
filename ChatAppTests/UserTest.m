

#import <XCTest/XCTest.h>
#import "UserModel.h"

@interface UserTest : XCTestCase

@end

@implementation UserTest



- (void)setUp {
    [super setUp];
}
//Hard coded data
//Nil and edge cases

- (NSString*)getMockJsonString{
    
    NSDateFormatter *fm = [NSDateFormatter new];
    [fm setDateFormat:@"dd/MM/yyyy"];
    int daysInTwoYears = 365*2;
    NSDate *date2yearsBack = [[NSDate date] dateByAddingTimeInterval:-((60*60*24*(daysInTwoYears + 1)))];
    
    NSString *dojStr = [fm stringFromDate:date2yearsBack];
    
    return dojStr;
}

- (void)testParseUser {

    NSString *dummyJson = @"{\"name\": \"John\",\"doj\" : \"26/07/2007\"}";
    
    UserModel *user1 = [[UserModel alloc] initWithJSONString:dummyJson];
    
    XCTAssertEqualObjects(user1.name, @"John");
    
}

-(void)testDictToParseResultInYears{
    
    
    NSString *dummyJson = [NSString stringWithFormat:@"{\"name\": \"John\",\"doj\" : \"%@\"}",[self getMockJsonString]];
    
    
    
    UserModel *user1 = [[UserModel alloc] initWithJSONString:dummyJson];
 
    XCTAssertEqualObjects(user1.memberSince, @"2 years ago");

}

-(void)testDictToParseNilJSON{
    
    
    UserModel *user1 = [[UserModel alloc] initWithJSONString:nil];
    
    XCTAssertEqualObjects(user1.memberSince, @"a while ago");
    
}

-(void)testDictToParseEmptyJSON{
    NSString *dummyJson = @"";
    
    UserModel *user1 = [[UserModel alloc] initWithJSONString:dummyJson];
    
    XCTAssertEqualObjects(user1.memberSince, @"a while ago");
    
}

-(void)testDictToParseInMonths{
    NSString *dummyJson = @"{\"name\": \"John\",\"doj\" : \"26/04/2016\"}";
    
    UserModel *user1 = [[UserModel alloc] initWithJSONString:dummyJson];
    
    XCTAssertEqualObjects(user1.memberSince, @"2 months ago");
    
}


-(void)testReadFileContents{
    
}

-(void)testParseDictionary{
    
}

-(void)testDictToParseResultInDays{
    
}

-(void)testDictToParseResultInMonths{
    
}


@end
