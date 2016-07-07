//
//  HttpClient.m
//  ChatApp
//
//  Created by Rohit Talwar on 07/07/16.
//  Copyright © 2016 Rajat Talwar. All rights reserved.
//

#import "HttpClient.h"

@implementation HttpClient

-(void)getRequest:(NSString*)path success:(void (^)(NSArray*))success failure:(void (^)(NSString*))failure{
    
    NSString *sendUrl = [NSString stringWithFormat:@"http://localhost:4567/%@",path];
    
    NSURL *url = [NSURL URLWithString:sendUrl];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSArray *results = [NSJSONSerialization JSONObjectWithData:data
                                                              options:0
                                                                error:NULL];
             
             success(results);
             
         }else {
             
             failure([connectionError description]);
         }
         
         
     }];
}

@end
