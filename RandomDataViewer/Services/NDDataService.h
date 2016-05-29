//
//  NDDataService.h
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 13/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NDDataItem.h"
#import "NDApiClient.h"

@interface NDDataService : NSObject

- (id) initWith:(NDApiClient *)client;
- (void) fetchDataWith:(void (^) (NSArray *))completion;

@end
