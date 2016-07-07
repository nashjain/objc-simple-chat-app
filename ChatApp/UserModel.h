

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

-(id)initWithJSONString:(NSString*)json;
- (id)initWithLocalFile:(NSString *)fileName ;

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *memberSince;


@end
