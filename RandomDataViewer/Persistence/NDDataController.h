//
//  NDDataController.h
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 15/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NDDataController : NSObject

@property (strong) NSManagedObjectContext *managedObjectContext;

+ (id)sharedDataController;
- (void)initializeCoreData;

@end
