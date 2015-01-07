//
//  ListCell.m
//  List
//
//  Created by William McDuff on 2015-01-07.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "ListCell.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation ListCell



// ONLY FOR DECLERATIONS WE CANNOT SET THE VALUE THERE: SET IN INSTANCE TYPE
{
    UIView *colorView;
    
    BOOL isDone;
    
    
    // a line 
    UIView *strikeThrough;
    
    UIButton *button;
    
   
}

-(instancetype)  initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = [UIColor blackColor];
    
    self.textLabel.textColor = [UIColor whiteColor];
    
    if (self) {
         self.textLabel.text = self.itemInfo[@"text"];
        
        // x, y top left
        colorView  = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 30, 10, 20, 20)];
        
        // 10 (20/2)
        colorView.layer.cornerRadius = 10;
        
        strikeThrough = [[UIView alloc] initWithFrame:CGRectMake(10, 20, self.frame.size.width, 1)];
        
        strikeThrough.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview: strikeThrough];
        [self.contentView addSubview: colorView];
        
        
        
     
        
    }
    
    
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    if ([[touch.view class] isSubclassOfClass:[UIView class]]) {
        
        if (CGRectContainsPoint(colorView.frame, touchLocation)) {
            
            if (colorView.backgroundColor  == [UIColor clearColor]) {
                colorView.backgroundColor = _itemInfo[@"color"];
            }
            
            else {
             colorView.backgroundColor = [UIColor clearColor];
            }
        }
        
        else {
            
            if (isDone == false) {
                 strikeThrough.hidden = true;
                isDone = true;
            }
            
            else {
                strikeThrough.hidden = false;
                isDone = false;
            }
           
            
        }
    }
    
    
}

-(void)buttonPressed {
    
    colorView.backgroundColor = [UIColor blueColor];
}

// SETTER OF OUR DICTIONARY VARIABLE (CHANGE ACCORDING TO VALUES OF DICTIONARIES)

-(void)setItemInfo:(NSDictionary *)itemInfo {
    
    
    colorView.backgroundColor = itemInfo[@"color"];
    self.textLabel.text = itemInfo[@"text"];

    // it is a boolValue (object type not primitive) so make sure to cast isDone as a boolValue)
    isDone = [itemInfo[@"done"] boolValue];
    
    strikeThrough.hidden = !isDone;
     isDone = itemInfo[@"done"];
     _itemInfo = itemInfo;
    
    
    
}


@end
