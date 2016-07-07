//
//  UserModel.h
//  ChatApp
//
//  Created by Rohit Talwar on 07/07/16.
//  Copyright © 2016 John Talwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

- (id)initWithLocalFile:(NSString *)fileName ;

@property(nonatomic,strong) NSString *name;
@property(nonatomic,readwrite) NSInteger age;


@end
