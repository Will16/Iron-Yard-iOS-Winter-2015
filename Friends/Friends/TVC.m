//
//  TVC.m
//  Friends
//
//  Created by Mollie on 1/22/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

#import "TVC.h"
#import <Parse/Parse.h>

@interface TVC ()
@property (weak, nonatomic) IBOutlet UITextField *itemTextField;

@end

@implementation TVC
{
    NSMutableArray *messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [PFUser currentUser].username = @"William";
    [PFUser currentUser].password = @"WmF16101";
    
    [[PFUser currentUser] saveInBackground];
    
    messages = [@[] mutableCopy];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(updateMessages) userInfo:nil repeats:YES];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)updateMessages {
    
    PFQuery *messageQuery = [PFQuery queryWithClassName:@"Message"];
    
    [messageQuery orderByDescending:@"updatedAt"];
    //    [messageQuery whereKey:@"owner" equalTo:[PFUser currentUser]];
    
    
    //includeKye  Make the query include PFObjects that have a reference stored at the provided key.
    // all messages that have something written by somebody (that has a owner (something for the key owner (that stores the PFUser of the message))
    
    [messageQuery includeKey:@"owner"];
    
    [messageQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (objects.count > 0) {
            
            
            // we put the pfobjects in an array
            messages = [objects mutableCopy];
            
            [self.tableView reloadData];
            
        }
        
    }];
    
}

- (IBAction)addMessage:(id)sender {
    
    PFObject *newMessage = [PFObject objectWithClassName:@"Message"];
    
    newMessage[@"text"] = self.itemTextField.text;
    newMessage[@"owner"] = [PFUser currentUser];
    
    [newMessage saveInBackground];
    
    self.itemTextField.text = @"";
    
    [messages insertObject:newMessage atIndex:0];
    
    [self.tableView reloadData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    
    PFObject *message = messages[indexPath.row];
    
    PFUser *owner = message[@"owner"];
    
    cell.textLabel.text = owner.username;
    
    // the value (string) for key text of the pfobject message
    cell.detailTextLabel.text = message[@"text"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        PFObject *item = messages[indexPath.row];
        
        // delete the object in parse
        [item deleteInBackground];
        
        [messages removeObjectAtIndex:indexPath.row];
        
        // delete the row with animation at the right indexPath
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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
