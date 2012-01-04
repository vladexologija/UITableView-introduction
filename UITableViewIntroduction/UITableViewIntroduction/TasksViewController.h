#import <UIKit/UIKit.h>

@interface TasksViewController : UITableViewController <UITextFieldDelegate>
{
    UIView *headerView;
    NSMutableArray *tasks;
}

-(UIView *) headerView;
@end
