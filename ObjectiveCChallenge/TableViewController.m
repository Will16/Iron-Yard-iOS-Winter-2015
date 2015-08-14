//
//  TableViewController.m
//  ObjectiveCChallenge
//
//  Created by William McDuff on 2015-04-03.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "TableViewController.h"
#import "APIRequest.h"

@interface TableViewController() <APIRequestProtocol>

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    APIRequest *api = [[APIRequest alloc] init];
    api.delegate = self;
    [api fetchDataFromUrl];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)didFinishFetchingData:(NSMutableArray *)results {

    
    self.booksDict = results;
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.booksDict.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    NSDictionary *bookDict = [self.booksDict objectAtIndex:indexPath.row];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    

    
    if ([bookDict objectForKey:@"author"] != nil) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.detailTextLabel.text = [bookDict objectForKey:@"author"];
        
        
    }
    
    
    if ([bookDict objectForKey:@"title"] != nil) {
        cell.textLabel.text = [bookDict objectForKey:@"title"];
    }
    
    
    
    if ([bookDict objectForKey:@"imageURL"] != nil) {
        
        NSURL *url = [NSURL URLWithString:[bookDict objectForKey:@"imageURL"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        cell.imageView.image = [UIImage imageWithData:data];
    }
    
    
    
    
    
    
    return cell;
}



@end
