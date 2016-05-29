//
//  NDUser.h
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 14/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NDUser : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *country;

- (id)initWith:(NSDictionary *)dictionary;

@end
