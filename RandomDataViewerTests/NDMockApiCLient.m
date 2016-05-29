//
//  NDMockApiCLient.m
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 14/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import "NDMockApiCLient.h"

@implementation NDMockApiCLient

+ (id) sharedClient {
    static NDMockApiCLient *sharedclient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedclient = [[self alloc] init];
    });
    return sharedclient;
}


- (void) getWith:(void(^)(NSArray *))completionBlock {
    
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"mock_response" ofType:@"json"];
    
    NSString *jsonResponse = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:[jsonResponse dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    completionBlock(json);
}

@end
