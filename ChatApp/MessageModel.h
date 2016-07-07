//
//  MessageModel.h
//  ChatApp
//
//  Created by Rohit Talwar on 07/07/16.
//  Copyright © 2016 Rajat Talwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MessageModelDelegate <NSObject>

-(void)didRefreshMessages;

@end

@interface MessageModel : NSObject

@property (nonatomic, weak) id<MessageModelDelegate> delegate;

-(NSUInteger)numberOfMessages;
-(void)setMessages:(NSArray*)messages;
-(NSString*)contentAtIndex:(NSUInteger)index;
-(void)appendMessage:(NSString*)mesg;

-(void)refreshMessagesWithSuccess:(void (^)(NSArray*))success failure:(void (^)(NSString*))failure;

-(void)sendMessage:(NSString*)mesg success:(void (^)(NSArray*))success failure:(void (^)(NSString*))failure;

@end
