#import <UIKit/UIKit.h>
#import "Task.h"

@interface TaskCell : UITableViewCell
{
    UILabel *descriptionLabel;
    UIButton *finishedCheckBox;
    UIButton *highPriorityCheckBox;
}

-(void)setTask:(Task *)task;

@end
