//
//  NDApiClient.m
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 13/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import "NDApiClient.h"

@implementation NDApiClient

+ (id) sharedClient {
    static NDApiClient *sharedclient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedclient = [[self alloc] init];
    });
    return sharedclient;
}

- (void) getWith:(void (^) (NSArray *))completionBlock {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://private-d847e-demoresponse.apiary-mock.com/questions"]];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        completionBlock(jsonData);
    }] resume];
}

@end
