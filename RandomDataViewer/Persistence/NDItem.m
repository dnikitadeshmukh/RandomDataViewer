//
//  NDItem.m
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 15/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import "NDItem.h"
#import "NDDataController.h"
#import "NDAppDelegate.h"

@implementation NDItem

@dynamic text;
@dynamic imageData;
@dynamic userName;
@dynamic userCountry;
@dynamic createdDate;

+ (void)save:(NDDataItem*)dataItem With:(UIImage*)image {
    
    if([self isPresentItem:dataItem WithImage:image]) {
        return;
    }
    
    NSManagedObjectContext *context = [(NDAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DataItem" inManagedObjectContext:context];
    NDItem *item = [[NDItem alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    item.text = [dataItem text];
    item.imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    item.userName = [[dataItem user] name];
    item.userCountry = [[dataItem user] country];
    item.createdDate = [dataItem createdDate];
    
    [context save:nil];
}

+ (NSArray *)getAll {
    NSManagedObjectContext *context = [(NDAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"DataItem"];
    return [context executeFetchRequest:fetchRequest error:nil];
}

+ (BOOL)isPresentItem:(NDDataItem *)item WithImage:(UIImage *)image {
    NSManagedObjectContext *context = [(NDAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"DataItem"];
    fetchRequest.predicate =  [NSPredicate predicateWithFormat:@"createdDate == %@ AND userName == %@", item.createdDate, item.user.name]; //
    NSArray *array = [context executeFetchRequest:fetchRequest error:nil];
    
    return [array count] > 0;
}

@end
