//
//  FriendsTVC.m
//  GithubFriends
//
//  Created by William McDuff on 2015-01-08.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "FriendsTVC.h"
#import "FriendCell.h"
#import "NewFriendVC.h"
#import "FriendDetailVC.h"
#import "AppDelegate.h"
#import "FriendDetailVC.h"


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
        @"login": @"joalbright",
        @"id": @1536630,
        @"name": @"Jo Albritght",
        @"company": @"The Iron Yard",
        @"blog":@"jo2.co",
        @"location": @"Atlanta,Ga",
        @"email": @"me@jo2.co",
        @"public_repos": @25,
        @"public_gists": @6,
        @"followers": @39,
        @"following": @48,
        @"avatar_url": @"https://avatars.githubusercontent.com/u/1536630?v=3"
        }
       ] mutableCopy];
    
   
    // Registers a class for use in creating new table cells.
    
    // if we don't have a storyboard, this is the way to use prototype cells that we have created in a class for our tableView
    [self.tableView registerClass:[FriendCell class] forCellReuseIdentifier:@"friendCell"];
 
    
    
    // target: The object that receives the action message
    UIBarButtonItem * addFriendButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend)];
    
    self.navigationItem.rightBarButtonItem = addFriendButton;
    
   
}

-(void)addFriend {
    
     // create a new friend
    NewFriendVC *newFriendVC = [[NewFriendVC alloc] init];
    
    // add our array of friends to the property array of our new friends (WHY: WHEN THE NEWFIIENDS CHANGES THE ARRAY WE WANT THE VC TO ACCESS THE SAME DATA NOT AN OLDER ONE (WE WANT BOTH TO COMMUNICATE WITH THE SAME ARRAY), SO WE HAVE TO HAVE MORE REFERENCES (TWO REFERENCES COUNT))
    
    // SAME POINTER FOR BOTH CLASSES SO THE ARRAY GETS UPDATED FOR BOTH CLASSES
    newFriendVC.friends = friends;
    
    // ^ means block (we don't want anything to be returned at completion so we but nil
    
    newFriendVC.view.backgroundColor = [UIColor purpleColor];
    
    
    // Whole other new NVC
    UINavigationController *nC2 = [[UINavigationController alloc] init];
    nC2.viewControllers = @[newFriendVC];
    
    // from botoom to top, when push without a NC from right to left
    [self presentViewController:nC2 animated:YES completion:nil];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
  
    return friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // Configure the cell...
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendCell" forIndexPath:indexPath];
    
    NSDictionary *friendInfo = friends[indexPath.row];
    
    cell.textLabel.text = friendInfo[@"name"];
    
    NSLog(@"%@", cell.textLabel.text);
    NSURL *avatarURL = [NSURL URLWithString:friendInfo[@"avatar_url"]];
    
 
    NSData *imageData = [NSData dataWithContentsOfURL:avatarURL];
    
    UIImage *image = [UIImage imageWithData:imageData];
    
    cell.imageView.image = image;
    
    return cell;
}


// DELEGATE METHOD: WE CLICK AND THE VIEW LETS THE TABLEVIEW KNOW
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // crate a mutable Copy of the ditionary

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    FriendDetailVC *detailVC = [[FriendDetailVC alloc] init];
    
    detailVC.username = cell.textLabel.text;
    
    detailVC.friendInfo = friends[indexPath.row];
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
    // 1.create another VC corresponding to detailVC (name: detailVC) 2. detailVC.username = cell.label.text 3. storyboard push the vc
    
    
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
