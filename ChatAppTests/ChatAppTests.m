//
//  ChatAppTests.m
//  ChatAppTests
//
//  Created by - on 29/06/16.
//  Copyright © 2016 -. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewController (ChatAppTests)

- (void)sendMessage:(NSString*)mesg onCompletion:(void (^)(BOOL success, NSError *error))completion;
- (NSArray *)tableData;
@end

@interface ChatAppTests : XCTestCase
@property (nonatomic, strong) ViewController *vc;
@end





@implementation ChatAppTests

- (void)setUp {
    [super setUp];
    self.vc = [[ViewController alloc] init];
}

- (void)tearDown {
    self.vc = nil;
    [super tearDown];
}


- (void)testMessageSend {
    
    NSString *mesg = @"Hi";
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing mesg sending"];
    
    [self.vc sendMessage:mesg onCompletion:^(BOOL success, NSError *error) {
        [expectation fulfill];
        XCTAssert(success,@"Sending to server failed");
    }];
    
    [self waitForExpectationsWithTimeout:0.5 handler:nil];
}

- (void)testMessageAddToDataSource {

    NSString *mesg = @"Hi";
    [self.vc sendMessage:mesg onCompletion:nil];
    XCTAssert([[self.vc tableData] containsObject:mesg], @"Failed adding table data");

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

@end
