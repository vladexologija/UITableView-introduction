#import "TasksViewController.h"
#import "Task.h"
#import "TaskCell.h"

@implementation TasksViewController

-(id) init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self){
        tasks = [[NSMutableArray alloc] init];
        
        [tasks addObject:[[Task alloc] initWithDescription:@"First task"]];
        [tasks addObject:[[Task alloc] initWithDescription:@"Second task"]];
        [tasks addObject:[[Task alloc] initWithDescription:@"Third task"]];
        [tasks addObject:[[Task alloc] initWithDescription:@"Fourth task"]];
        
    }
    
    [[self navigationItem] setRightBarButtonItem: [self editButtonItem]];  
    // Set the title
    [[self navigationItem] setTitle:@"Tasks"];
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{ 
    return [self init]; 
}

// Custom background for the table view
- (void) viewDidLoad 
{
    self.navigationController.view.backgroundColor = [UIColor colorWithPatternImage:
                                                     [UIImage imageNamed:@"wood.png"]]; 
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor]; 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // number of rows
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TaskCell *cell = (TaskCell*)[tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
        
    if(!cell){
        cell = [[[TaskCell alloc] 
                 initWithStyle:UITableViewCellStyleDefault 
                 reuseIdentifier:@"TaskCell"] autorelease];
    }
    
    Task *task = [tasks objectAtIndex:[indexPath row]];    
    [cell setTask:task];   
    
    return cell;
}

-(UIView *)headerView
{
    if (headerView) {
        return headerView;
    }   
    
    // Container for our textField
    float w = UIScreen.mainScreen.bounds.size.width;   
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(8.0, 8.0, w - 16.0, 30.0)];
    textField.placeholder = @"Add a new task";
    textField.borderStyle = UITextBorderStyleLine;
    UIColor *color = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
    textField.backgroundColor = color;
    [color release];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font =  [UIFont systemFontOfSize:14];    
    textField.textColor = [UIColor whiteColor];
    [textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];  
    textField.delegate = self;
    
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0, w, 48)];  
    [headerView addSubview:textField];
    [textField release];
    
    return headerView;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    if ([textField.text length] > 0) {
        [tasks addObject:[[Task alloc] initWithDescription:textField.text]];
        [self.tableView reloadData];
        [textField setText:@""];
    }
   
    return YES;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Are we deleting row?
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        // Remove object from tasks
        [tasks removeObjectAtIndex:[indexPath row]];
        
        // Remove object from tableView
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
                         withRowAnimation:UITableViewRowAnimationFade];
        
    } 
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{   
    // Get the object we are going to move
    Task *task = [tasks  objectAtIndex:[destinationIndexPath row]];
    
    // We will delete and move it to another location so well have to retain it
    [task retain];
    
    // Remove it an move it to other place
    [tasks removeObjectAtIndex:[sourceIndexPath row]];
    [tasks insertObject:task atIndex:[destinationIndexPath row]];
    
    // We no longer need it 
    [task release];
}

- (UIView *)tableView:(UITableView *)tv viewForHeaderInSection:(NSInteger) sec
{ 
    return [self headerView]; 
}

- (CGFloat)tableView:(UITableView *)tv heightForHeaderInSection:(NSInteger)sec
{
    return [[self headerView] frame].size.height;
}

- (void)dealloc
{
    [tasks release];
    [headerView release];
    [super dealloc];
}

@end
