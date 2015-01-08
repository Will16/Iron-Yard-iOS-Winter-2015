//
//  FriendsTVC.m
//  GithubFriends
//
//  Created by William McDuff on 2015-01-08.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "FriendsTVC.h"
#import "FriendCell.h"

@interface FriendsTVC ()

@end

@implementation FriendsTVC {
    NSMutableArray *friends;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // (NSMutableArray *) casting only puts a name tag on the array, doesn't change the inners of the function
    // putting mutableCopy changes the inners of the function to be a mutable copy
    friends = [@[] mutableCopy];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    friends = [@
                 
                 [@{
        
            // @number turns the number into an object (so you can put it in a dictionary)
        @"id": @1536630,
        @"name": @"Jo Albritght",
        @"company": @"The Iron Yard",
        @"blog":@"jo2.co",
        @"location": @"Atlanta,Ga",
        @"email": @"me@jo2.co",
        @"public_repos": @25,
        @"public_gists": @6,
        @"followers": @39,
        @"following": @48
        }
       ] mutableCopy];
    
    
    // Registers a class for use in creating new table cells.
    
    // if we don't have a storyboard, this is the way to use prototype cells that we have created in a class for our tableView
    [self.tableView registerClass:[FriendCell class] forCellReuseIdentifier:@"friendCell"];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // Configure the cell...
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendCell" forIndexPath:indexPath];
    
    NSDictionary *friendInfo = friends[indexPath.row];
    return cell;
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
