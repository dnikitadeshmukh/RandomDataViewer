//
//  NDFavoriteViewController.m
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 15/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import "NDFavoriteViewController.h"
#import "NDItem.h"
#import "NDFavoriteItemCell.h"

@interface NDFavoriteViewController ()

@property (nonatomic, strong) NSArray *favoriteItems;

@end

@implementation NDFavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _favoriteItems = [NSArray array];
    _favoriteItems = [NDItem getAll];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_favoriteItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NDFavoriteItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteCell" forIndexPath:indexPath];
    
    [cell configureDataItem:[_favoriteItems objectAtIndex:[indexPath row]]];
    
    return cell;
}

@end
