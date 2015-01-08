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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UITextField *usernameField = [[UITextField alloc] initWithFrame: CGRectMake(10, 10, 300, 40)];
    
    [self.view addSubview:usernameField];
    
    UIButton *saveFriend = [[UIButton alloc] initWithFrame:CGRectMake(10, 60, 300, 40)];
    
    UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(10, 110, 300, 40)];
    
    
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    
    [cancel addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancel];
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
