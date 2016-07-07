

#import <XCTest/XCTest.h>
#import "UserModel.h"

@interface UserTest : XCTestCase

@end

@implementation UserTest



- (void)setUp {
    [super setUp];
}


- (void)testParseUser {
    UserModel *user1 = [[UserModel alloc] initWithLocalFile:@"user.json"];
    
    XCTAssertEqualObjects(user1.memberSince, @"8 years ago");

    
}


@end
