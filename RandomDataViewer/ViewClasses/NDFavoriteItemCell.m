//
//  NDFavoriteItemCell.m
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 15/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import "NDFavoriteItemCell.h"

@interface NDFavoriteItemCell()

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *country;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UITextView *itemTextView;

@end

@implementation NDFavoriteItemCell

- (void)configureDataItem:(NDItem *)item {
    _itemTextView.hidden = item.text == nil;
    _itemImageView.hidden = item.imageData == nil;
    
    [_itemImageView setImage:[UIImage imageWithData:[item imageData]]];
    _itemTextView.text = item.text;
    _name.text = [item userName];
    _country.text = [item userCountry];
    _date.text = [item createdDate];
}

@end
