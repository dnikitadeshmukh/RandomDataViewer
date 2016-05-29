//
//  NDDataController.m
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 15/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import "NDDataController.h"

@implementation NDDataController

+ (id) sharedDataController {
    static NDDataController *sharedDataController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataController = [[self alloc] init];
    });
    return sharedDataController;
}

- (void)initializeCoreData {
    
    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:@"RandomDataViewer" withExtension:@"momd"];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelUrl];
    
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [context setPersistentStoreCoordinator:coordinator];
    [self setManagedObjectContext:context];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsUrl = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeUrl = [documentsUrl URLByAppendingPathComponent:@"RandomDataViewer.sqlite"];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = [[self managedObjectContext] persistentStoreCoordinator];
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error];
        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    });
}

@end
