//
//  NDApiClient.h
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 13/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NDApiClient : NSObject

+ (id) sharedClient;
- (void) getWith:(void(^)(NSArray *))completionBlock;

@end
