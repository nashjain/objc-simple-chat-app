//
//  MessageModel.m
//  ChatApp
//
//  Created by Rohit Talwar on 07/07/16.
//  Copyright © 2016 Rajat Talwar. All rights reserved.
//

#import "MessageModel.h"
#import "HttpClient.h"

@implementation MessageModel
NSMutableArray *_messages;

HttpClient *client;

- (id)init{
    self = [super init];
    if (self) {
        _messages = [NSMutableArray new];
        
        client = [HttpClient new];
        
        [self reloadMessages];
        [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(reloadMessages) userInfo:nil repeats:true];

    }
    return self;
}

-(void)reloadMessages{
    
    [self refreshMessagesWithSuccess:^(NSArray *mesgs) {
        [self callDelegateForRefreshMessagesDone];

    } failure:^(NSString *err) {
        
    }];
}
-(NSUInteger)numberOfMessages{
    
    return _messages.count;
}

-(void)setMessages:(NSArray*)messages{
    
    _messages = [NSMutableArray arrayWithArray:messages];
}

-(void)appendMessage:(NSString*)mesg{
    [_messages addObject:mesg];
}
-(NSString*)contentAtIndex:(NSUInteger)index{
    
    return index < _messages.count ? _messages[index] : @"";
}

-(void)sendMessage:(NSString*)mesg success:(void (^)(NSArray*))onsuccess failure:(void (^)(NSString*))onfailure{
    
    [self appendMessage:mesg];
    
    [client getRequest:[NSString stringWithFormat:@"send?message=%@",mesg] success:^(NSArray *mesgs) {
        
        [self setMessages:mesgs];
        onsuccess(mesgs);
        
    } failure:^(NSString *err) {
        onfailure(err);
    }];
    

}


-(void)callDelegateForRefreshMessagesDone{
    if(self.delegate){
        [self.delegate didRefreshMessages];
    }
}
-(void)refreshMessagesWithSuccess:(void (^)(NSArray*))onsuccess failure:(void (^)(NSString*))onfailure{
    
    NSString *sendUrl = [NSString stringWithFormat:@"http://localhost:4567/fetchAllMessages"];
    
    
    [client getRequest:@"fetchAllMessages" success:^(NSArray *mesgs) {
        
        [self setMessages:mesgs];
        onsuccess(mesgs);
        
    } failure:^(NSString *err) {
        onfailure(err);
    }];
    
}

@end
