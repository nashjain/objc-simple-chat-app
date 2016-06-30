//
//  ChatAppTests.m
//  ChatAppTests
//
//  Created by - on 29/06/16.
//  Copyright © 2016 -. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ChatAppTests : XCTestCase

@end

@implementation ChatAppTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)messageSendTest {
    // A test to check message was sent successfully and is added successfully to the list of all messages which is used to update view data
    
    
}

- (void)messageSendTest2 {
    // A test to check message was sent successfully and is added successfully only once to the list of all messages which is used to update view data
    
    
}


- (void)messageSendFailtest {
    // In case of network error, proper error message must be shown to user about failure to send message and view  must not update with this failed message
    
    
}

- (void)messageRefresh {
    // In case messages are downloaded from server and there are no new messages, the view showing the number of chat messages shud not increase or decrease the messages.
    
    
}

- (void)messageRefresh2 {
    // In case of network re-connection, the message view should show  the messages which were missed during network disconnected state
    
    
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
