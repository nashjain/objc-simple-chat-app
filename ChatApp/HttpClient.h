//
//  HttpClient.h
//  ChatApp
//
//  Created by Rohit Talwar on 07/07/16.
//  Copyright © 2016 Rajat Talwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpClientInterface <NSObject>

-(void)getRequest:(NSString*)path success:(void (^)(NSArray*))success failure:(void (^)(NSString*))failure ;

@end

@interface HttpClient : NSObject<HttpClientInterface>

-(void)getRequest:(NSString*)path success:(void (^)(NSArray*))success failure:(void (^)(NSString*))failure ;



@end
