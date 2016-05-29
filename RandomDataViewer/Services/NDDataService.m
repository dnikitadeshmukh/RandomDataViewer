//
//  NDDataService.m
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 13/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import "NDDataService.h"
#import "NDDataItem.h"

@interface NDDataService() {
    NDApiClient *apiClient;
}

@end

@implementation NDDataService

- (id) initWith:(NDApiClient *)client {
    self = [super init];
    if(self) {
        apiClient = client;
    }
    return self;
}

- (void) fetchDataWith:(void (^) (NSArray *))completion {
    NSMutableArray *items = [NSMutableArray array];
    [apiClient getWith:^(NSArray *jsonArray) {
        for (NSDictionary *dataItem in jsonArray) {
            NDDataItem *item = [[NDDataItem alloc] initWith:dataItem];
            [items addObject:item];
        }
        completion(items);
    }];
}

@end
