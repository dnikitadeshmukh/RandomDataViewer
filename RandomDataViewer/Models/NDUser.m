//
//  NDUser.m
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 14/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import "NDUser.h"

@implementation NDUser

- (id)initWith:(NSDictionary *)dictionary {
    self = [super init];
    if(self) {
        _name = [dictionary objectForKey:@"name"];
        _country = [dictionary objectForKey:@"country"];
    }
    return self;
}

@end
