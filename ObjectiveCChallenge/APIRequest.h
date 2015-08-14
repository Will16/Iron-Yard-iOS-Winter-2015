//
//  APIRequest.h
//  ObjectiveCChallenge
//
//  Created by William McDuff on 2015-04-05.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol APIRequestProtocol <NSObject>

- (void)didFinishFetchingData:(NSMutableArray *)results;

@end

@interface APIRequest : NSObject

@property (nonatomic, assign) id <APIRequestProtocol> delegate;

-(void) fetchDataFromUrl;

@end


