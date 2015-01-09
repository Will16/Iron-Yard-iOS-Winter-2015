//
//  NewFriendVC.m
//  GithubFriends
//
//  Created by William McDuff on 2015-01-08.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "NewFriendVC.h"

@interface NewFriendVC ()

@end

@implementation NewFriendVC
{
    UITextField *usernameField;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
    usernameField = [[UITextField alloc] initWithFrame: CGRectMake(10, 50, 300, 40)];
    usernameField.placeholder = @"Username";
    [self.view addSubview:usernameField];
    
    UIButton *saveFriend = [[UIButton alloc] initWithFrame:CGRectMake(10, 110, 300, 40)];
    [saveFriend setTitle:@"Git User" forState: UIControlStateNormal];
    [saveFriend addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveFriend];
    
    
    UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(10, 160, 300, 40)];
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancel];
}

-(void)save {
    
    NSString *username = usernameField.text;
    
    
    // define a String corresponding to url
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@", username];
    
    // convert to url
    NSURL *url = [NSURL URLWithString:urlString];
    
    // create a request with this url
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // using this urlrequest send a request and return the responseData
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // convert the responseData to dictionary
    NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    
    // return the json data to our userInfo
    // IT TRANSFERS TO FRIENDSTVC BECAUSE BOTH ARE POINTING TO THE SAME OBJECT
    [self.friends addObject:userInfo];
    
    // dismiss view cntroller
    [self cancel];
}


-(void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
