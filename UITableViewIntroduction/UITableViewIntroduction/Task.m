#import "Task.h"

@implementation Task

@synthesize taskId, description, dateCreated, highPriority, finished;

// Default initialization
-(id) initWithDescription:(NSString *)desc
{
    self = [super init];
    
    if (self) {
        // Just some random value
        self.taskId = [NSString stringWithFormat:@"%c%c%c%c%c",
                       '0' + rand() % 10,
                       'A' + rand() % 26,
                       '0' + rand() % 10,
                       'A' + rand() % 26,
                       '0' + rand() % 10];
        
        self.description = desc;
        self.dateCreated = [[NSDate alloc] init];
        self.highPriority = FALSE;
        self.finished = FALSE;
    }
    return self;
}

-(void) dealloc
{
    [taskId release];
    [description release];
    [dateCreated release];
}

@end
