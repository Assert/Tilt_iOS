//
//  TiltTests.m
//  TiltTests
//
//  Created by Eystein Bye on 01/04/14.
//  Copyright (c) 2014 Assert. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TiltCalc.h"

@interface TiltTests : XCTestCase

@end

@implementation TiltTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testDemoOfStringCompair {
    NSString *string1 = @"EB";
    NSString *string2 = @"EB";
   
    XCTAssertEqual(string1, string2, @"The strings are not the same");
}

- (void) testToDeg {
    id calc = [[TiltCalc alloc] init];
    
    float calcResult = [calc calcDeg:0.222];
    float expectedResult = 70.02;
    
    XCTAssertEqual(calcResult, expectedResult, @"Not the same");

    calcResult = [calc calcDeg:0];
    expectedResult = 90;
    
    XCTAssertEqual(calcResult, expectedResult, @"Not the same");
    
    calcResult = [calc calcDeg:1];
    expectedResult = 0;
    
    XCTAssertEqual(calcResult, expectedResult, @"Not the same");
}

@end
