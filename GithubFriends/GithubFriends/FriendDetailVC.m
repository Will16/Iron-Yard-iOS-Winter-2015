//
//  FriendDetailVC.m
//  GithubFriends
//
//  Created by William McDuff on 2015-01-08.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "FriendDetailVC.h"

// Add property to this class .h called  "friendInfo"

// Grab the request code from NewFriendVC.m

// Change the url to https://github.com/users/USERNAME/repos

// dyanimc means parameter for USERNAME
//%@/repos, parameter)

//  make USERNAME dynamic based on friendInfo[@"login"]

// the return will be an NSArray of repos

// log the repos array

// Extra

// make selecting a cell push to FriendDetailVC

// and set friendInfo based on cell selected


@interface FriendDetailVC ()

@end

@implementation FriendDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self save];
    // Do any additional setup after loading the view.
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)save {
    

    NSString *githubName = self.friendInfo[@"login"];
    // define a String corresponding to url
     NSString * urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", githubName];
    
    // convert to url
    NSURL *url = [NSURL URLWithString:urlString];
    
    // create a request with this url
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // using this urlrequest send a request and return the responseData
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // convert the responseData to dictionary
    NSArray *userInfo = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@", userInfo);
    // return the json data to our userInfo
    // IT TRANSFERS TO FRIENDSTVC BECAUSE BOTH ARE POINTING TO THE SAME OBJECT

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
