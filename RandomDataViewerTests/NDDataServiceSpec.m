//
//  NDDataServiceSpec.m
//  RandomDataViewer
//
//  Created by NIkita Deshmukh on 14/05/16.
//  Copyright © 2016 NIkita Deshmukh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NDDataService.h"
#import "NDMockApiCLient.h"

@interface NDDataServiceSpec : XCTestCase

@end

@implementation NDDataServiceSpec

- (void)testShouldReturnArrayOfItems {
    NDDataService *service = [[NDDataService alloc] initWith: [NDMockApiCLient sharedClient]];
    XCTestExpectation *expectation = [self expectationWithDescription:@"successful service call"];
    
    [service fetchDataWith:^(NSArray *array) {
        XCTAssertTrue([array count] == 13);
        XCTAssertTrue([[array objectAtIndex:0] isKindOfClass:[NDDataItem class]]);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

@end
