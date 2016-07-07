

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

- (id)initWithLocalFile:(NSString *)fileName ;

@property(nonatomic,strong) NSString *name;
@property(nonatomic,readwrite) NSInteger age;


@end
