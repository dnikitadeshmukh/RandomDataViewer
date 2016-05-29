//
//  NDItem.h
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 15/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "NDDataItem.h"

@interface NDItem : NSManagedObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSData *imageData;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userCountry;
@property (nonatomic, strong) NSString *createdDate;

+ (void)save:(NDDataItem*)dataItem With:(UIImage*)image;
+ (NSArray *)getAll;

@end
