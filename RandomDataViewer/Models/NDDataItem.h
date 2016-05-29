//
//  DataItem.h
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 14/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "NDUser.h"

@interface NDDataItem : NSObject

@property (nonatomic, strong) NDUser *user;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *createdDate;

- (NDDataItem *) initWith:(NSDictionary *)json;

@end
