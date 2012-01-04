#import "TaskCell.h"

@implementation TaskCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Standard label initalization
        descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        descriptionLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:descriptionLabel];
        [descriptionLabel release];
        
        // Define images for all three states
        finishedCheckBox = [[UIButton alloc] initWithFrame:CGRectZero];
        [finishedCheckBox setBackgroundImage:[UIImage imageNamed:@"checkbox.png"] 
                                    forState:UIControlStateNormal];
        [finishedCheckBox setBackgroundImage:[UIImage imageNamed:@"checkbox-pressed.png"] 
                                    forState:UIControlStateHighlighted];
        [finishedCheckBox setBackgroundImage:[UIImage imageNamed:@"checkbox-checked.png"] 
                                    forState:UIControlStateSelected];
        [finishedCheckBox setCenter:CGPointMake(100,200)];
        [finishedCheckBox addTarget:self action:@selector(toggleCheckBox:) 
                   forControlEvents: UIControlEventTouchUpInside];
        [self.contentView addSubview:finishedCheckBox];
        [finishedCheckBox release];
        
        highPriorityCheckBox = [[UIButton alloc] initWithFrame:CGRectZero];
        [highPriorityCheckBox setBackgroundImage:[UIImage imageNamed:@"star.png"] 
                                    forState:UIControlStateNormal];
        [highPriorityCheckBox setBackgroundImage:[UIImage imageNamed:@"star.png"] 
                                    forState:UIControlStateHighlighted];
        [highPriorityCheckBox setBackgroundImage:[UIImage imageNamed:@"star-checked.png"] 
                                    forState:UIControlStateSelected];
        [highPriorityCheckBox setCenter:CGPointMake(100,200)];
        [highPriorityCheckBox addTarget:self action:@selector(toggleCheckBox:) 
                   forControlEvents: UIControlEventTouchUpInside];
        [self.contentView addSubview:highPriorityCheckBox];
        [highPriorityCheckBox release];
        
    }
    return self;
}

// Checkbox on/off
- (IBAction)toggleCheckBox:(UIButton *)button{
    button.selected = !button.selected;
} 

// Dimensions are ready
- (void) layoutSubviews
{
    [super layoutSubviews];
    
    // Dimensions, spaces and positions
    float space = 10.0;
    CGRect bounds = [[self contentView] bounds]; 
    float h = bounds.size.height;
    float w = bounds.size.width;
    float c = 15.0;
    float x = (h-c)/2;
    float valueWidth = 40.0;
    
    CGRect contentFrame = CGRectMake(x, x, c, c);
    [finishedCheckBox setFrame:contentFrame];
    
    contentFrame.origin.x += contentFrame.size.width + space; 
    [highPriorityCheckBox setFrame:contentFrame];
    
    contentFrame.origin.x += contentFrame.size.width + space; 
    contentFrame.size.width = w - ((h-c)/2 + valueWidth + space * 4); 
    [descriptionLabel setFrame:contentFrame];
    
}

// Set the tasks we want to be displayed
-(void)setTask:(Task *)task
{
    [descriptionLabel setText:task.description];
}


// We won't be doing anything for now
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:false animated:false];
}

@end
