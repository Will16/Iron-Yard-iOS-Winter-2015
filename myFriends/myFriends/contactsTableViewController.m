//
//  contactsTableViewController.m
//  myFriends
//
//  Created by William McDuff on 2015-01-22.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "contactsTableViewController.h"
#import <Parse/Parse.h>


/*
Homework :
- new app named my friends
- uses parse (save user with username and password)
- tableviewcontroller that shows friends (user query... this is special case look into how to query user's)
- have a column on user class "friends" that is an array (when a friend is selected, add them to currentuser's friend array)
 
 */


@interface contactsTableViewController ()

@end

@implementation contactsTableViewController


{
    NSMutableArray *users;
    
    NSMutableArray *friends;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
  //  [self createNewUsers];
    


    users = [@[] mutableCopy];
    
    friends = [@[] mutableCopy];
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(updateUsers) userInfo:nil repeats:YES];
    
    
    
}


/*
-(void) createNewUsers {
    PFUser *newUser = [PFUser user];
    newUser.username = @"sam";
    newUser.password = @"sam";

    
    [newUser signUpInBackground];
    
    PFUser *newUser2 = [PFUser user];
    newUser2.username = @"carl";
    newUser2.password = @"carl";

    
    [newUser2 signUpInBackground];
}
 */



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)updateUsers {
    
    PFQuery *usersQuery = [PFQuery queryWithClassName:@"_User"];
    
    [usersQuery whereKey:@"objectId" notEqualTo:[PFUser currentUser].objectId];
 


    
    [usersQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (objects.count > 0) {
            
            
            // we put the pfobjects in an array
            users = [objects mutableCopy];
            
            [self.tableView reloadData];
            
        }
        
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [users count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    PFUser *user = users[indexPath.row];

    
    cell.textLabel.text = user.username;
    


    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PFUser * friend = users[indexPath.row];
    

    [self addFriendToOurFriendsArray:friend];
  

    
    

    
}

-(void) addFriendToOurFriendsArray:(PFUser*) friend {
    
    PFQuery *friendQuery = [PFUser query];
    
    
    
    [friendQuery includeKey:@"friends"];
    [friendQuery whereKey:@"objectId" equalTo:[PFUser currentUser].objectId];
    
    [friendQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (objects.count > 0) {
            
            NSLog(@"user: %@", [PFUser currentUser].username);
            PFUser *user = [objects lastObject];
            NSMutableArray *friendsOfUser = user[@"friends"];
            
            if (friendsOfUser == nil) {
                
                NSLog(@"emptyArray");
                friendsOfUser = [[NSMutableArray alloc] init];
                [friendsOfUser addObject:friend];
                 user[@"friends"] = friendsOfUser;
                
                 NSLog(@"array %@", friendsOfUser);
                
                [user saveInBackground];
            }
            else {
                
                NSLog(@"%@",friend);
                NSLog(@"%@",friendsOfUser);
                
                
            //   if (![friendsOfUser containsObject:friend])
                for (PFUser *friendUser in friendsOfUser) {
                    
                    // array
                    if ([friendUser.objectId isEqual:friend.objectId]) {
                  
                        return;
                        
                        
                    }
                    
                }
                
                
                NSLog(@"array does not contain the user");
                [friendsOfUser addObject:friend];
                NSLog(@"array %@", friendsOfUser);
                NSLog(@"user: %@", friend.username);
                user[@"friends"] = friendsOfUser;
           
                [user saveInBackground];
                
                /*
                if (![friendsOfUser containsObject:friend]) {
                    
                    NSLog(@"array does not contain the user");
                    [friendsOfUser addObject:friend];
                    NSLog(@"array %@", friendsOfUser);
                    NSLog(@"user: %@", friend.username);
                    user[@"friends"] = friendsOfUser;
                    
                    [user saveInBackground];
                }
                  */
            }
           
         
            // friends = friendsOfUser;
        }
        
    }];
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
