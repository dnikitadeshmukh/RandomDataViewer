//
//  DataItem.m
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 14/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import "NDDataItem.h"
#import "NDDataController.h"

@implementation NDDataItem

- (NDDataItem *) initWith:(NSDictionary *)json {
    self = [super init];
    if(self) {
        _user = [[NDUser alloc] initWith:[json objectForKey:@"user"]];
        _url = [[json objectForKey:@"data"] objectForKey:@"url"];
        _text = [[json objectForKey:@"data"] objectForKey:@"text"];
        _createdDate = [self createdDateStringOf:[self convertLongToDate:[json objectForKey:@"created"]]];
    }
    return self;
}

- (NSDate *)convertLongToDate:(NSNumber *)interval {
    return [NSDate dateWithTimeIntervalSince1970: [interval longLongValue]];
}

- (NSString *) createdDateStringOf:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    return [dateFormatter stringFromDate:date];
}
@end
