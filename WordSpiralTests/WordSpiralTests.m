//
//  WordSpiralTests.m
//  WordSpiralTests
//
//  Created by Zakk Hoyt on 9/7/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WordProcessor.h"

@interface WordSpiralTests : XCTestCase

@end

@implementation WordSpiralTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"input" ofType:@"txt"];
    NSArray *words = [WordProcessor countWordsInFileAtPath:path];
    NSLog(@"Counted %lu words: \n%@", words.count, words.description);
    
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
