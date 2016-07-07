//
//  UserTest.m
//  ChatApp
//
//  Created by Rohit Talwar on 07/07/16.
//  Copyright © 2016 John Talwar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserModel.h"

@interface UserTest : XCTestCase

@end

@implementation UserTest

UserModel *user1;


- (void)setUp {
    [super setUp];
     user1 = [[UserModel alloc] initWithLocalFile:@"user.json"];
}


- (void)testParseUser {
    
    XCTAssertEqualObjects(user1.name, @"John");
    XCTAssertEqual(user1.age, 28);
    
}


@end
