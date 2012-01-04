#import <Foundation/Foundation.h>

@interface Task : NSObject
{   
    NSString *taskId;
    NSString *description;
    NSDate *dateCreated;
    BOOL highPriority;
    BOOL finished;
}

-(id) initWithDescription:(NSString *)desc;

@property (nonatomic,retain)  NSString *description; 
@property (nonatomic,retain)  NSString *taskId;
@property (nonatomic,retain)  NSDate *dateCreated;
@property (nonatomic) BOOL highPriority;
@property (nonatomic) BOOL finished;

@end
