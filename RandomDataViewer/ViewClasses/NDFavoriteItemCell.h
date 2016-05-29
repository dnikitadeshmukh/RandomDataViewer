//
//  NDFavoriteItemCell.h
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 15/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDItem.h"

@interface NDFavoriteItemCell : UITableViewCell

- (void)configureDataItem:(NDItem *)item;

@end
