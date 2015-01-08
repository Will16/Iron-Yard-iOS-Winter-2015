//
//  ListTVC.m
//  List
//
//  Created by William McDuff on 2015-01-07.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "ListTVC.h"
#import "ListCell.h"


// Finish coloring & laying out the tableViewCell based on design

// change row height (done)

// make the separator go all the way to the left side (done)

// listen for touches on the cell (will use for strike through)

// listen for touches on the colorView (will use for toggling the color)

// add 10 items to array (done)

// Extra;
// Add swipe to delete
// make the array mutable



@interface ListTVC ()

@end

@implementation ListTVC
{
    
    NSArray *listeItemsArray;
    NSMutableArray *listItems;
    
    BOOL isDone;

    
}


- (instancetype)init {
    
    self = [super init];
    
    self.view.backgroundColor = [UIColor blackColor];
    if (self) {
        
       /*
        
        listItems = @[@"item1",@"item2",@"item3",@"item4",@"item5"];
     
        
        NSDictionary *d = [[NSDictionary alloc] initWithObjectsAndKeys:@"this is the text", @"text", [UIColor greenColor], @"color", nil];
        
        NSDictionary *sd = @{
                             @"text": @"this is the text",
                             @"color": [UIColor greenColor]
                             };
        
        */
        
        
        /*
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

         */
        
        listeItemsArray = @[
                      // array value in dictionary
                      @{
                          
                          @"text":@"item1",
                          @"color":[UIColor greenColor],
                          
                          /* You have to transform numbers and bool into literals (that transform into objects) and not primitives because primitives are C objects (you can't put them in a dictionary) 
                       */
                          
                          // done for the checkmark
                          @"done":@NO
                    
                          },
                      
                      @{
                          @"text": @"item2",
                          @"color": [UIColor orangeColor],
                          @"done": @NO
                          },
                      
                      
                      
                      @{
        
                          @"text": @"item3",
                          @"color": [UIColor purpleColor],
                          @"done":@NO
                          },
                      
                      // 10 others
                      @{
                          
                          @"text": @"item4",
                          @"color": [UIColor blueColor],
                          @"done":@NO
                          },
                      
                      @{
                          
                          @"text": @"item6",
                          @"color": [UIColor redColor],
                          @"done":@NO
                          },
                      
                      @{
                          
                          @"text": @"item8",
                          @"color": [UIColor whiteColor],
                          @"done":@NO
                          },
                      
                      
                      @{
                          
                          @"text": @"item9",
                          @"color": [UIColor orangeColor],
                          @"done":@NO
                          },
                      
                      @{
                          
                          @"text": @"item10",
                          @"color": [UIColor greenColor],
                          @"done":@NO
                          },
                      
                      @{
                          
                          @"text": @"item11",
                          @"color": [UIColor redColor],
                          @"done":@NO
                          },
                      
                      @{
                          
                          @"text": @"item12",
                          @"color": [UIColor purpleColor],
                          @"done":@NO
                          },
                      
                      @{
                          
                          @"text": @"item13",
                          @"color": [UIColor blueColor],
                          @"done":@NO
                          },
                      
                      
                      
                      ];
        
        listItems = [listeItemsArray mutableCopy];
    }
   
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return listItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[ListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
  


    cell.itemInfo = listItems[indexPath.row];

    

   
    return cell;
}

// called before laying out the views

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // if it responds to the method, setSeparatorsInset to be 0, 0
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // same thing but not for separators, but insets of the cell (will change the position of the content of the cell)
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

// same but called after laying out the views

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // crate a mutable Copy of the ditionary
    NSMutableDictionary *listItem = [listItems[indexPath.row] mutableCopy];
    
    isDone = [listItem[@"done"] boolValue];
    

 
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        [listItems removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [tableView reloadData]; // tell table to refresh now
    }
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
