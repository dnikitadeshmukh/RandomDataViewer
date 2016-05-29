//
//  NDRandomDataViewController.m
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 14/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import "NDRandomDataViewController.h"
#import "NDDataService.h"
#import "NDItem.h"

#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))


@interface NDRandomDataViewController ()
@property (nonatomic, strong) NDDataService *service;
@property (nonatomic, strong) NSArray *dataItems;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *country;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *imageSpinner;

@property (nonatomic, strong) NDDataItem *displayedItem;

@end

@implementation NDRandomDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.service = [[NDDataService alloc] initWith:[NDApiClient sharedClient]];
    [_spinner startAnimating];
    [self.service fetchDataWith:^(NSArray *items) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.dataItems = items;
            [self showRandomDataItem:items];
        });
    }];
}

- (void)showRandomDataItem:(NSArray *)items {
    _containerView.hidden = NO;
    [_spinner stopAnimating];
    NSInteger randomIndex = RAND_FROM_TO(0, ([_dataItems count] - 1));
    _displayedItem = [_dataItems objectAtIndex:randomIndex];
    [self displayItem];
}

- (void)displayItem {
    _name.text = [[_displayedItem user] name];
    _country.text = [[_displayedItem user] country];
    
    _image.hidden = [_displayedItem url] == nil;
    _textView.hidden = [_displayedItem text] == nil;
    
    _textView.text = [_displayedItem text];
    _date.text = [_displayedItem createdDate];
    
    [self displayImageWith:[NSURL URLWithString:[_displayedItem url]]];
}

-(void) displayImageWith:(NSURL *)url {
    __block UIImage *fetchedImage;
    
    [_imageSpinner startAnimating];
    NSBlockOperation *imageOperation = [NSBlockOperation blockOperationWithBlock:^{
        fetchedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    }];
    
    [imageOperation setCompletionBlock:^{
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [_image setImage:fetchedImage];
            [_imageSpinner stopAnimating];
        }];
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:imageOperation];
}

- (IBAction)markAsFavorite:(UIButton *)sender {
    [NDItem save:_displayedItem With:_image.image];
}
- (IBAction)RefreshView:(UIButton *)sender {
    [self showRandomDataItem:_dataItems];
}

@end
