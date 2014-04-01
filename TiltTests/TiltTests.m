//
//  TiltTests.m
//  TiltTests
//
//  Created by Eystein Bye on 01/04/14.
//  Copyright (c) 2014 Assert. All rights reserved.
//

#import <XCTest/XCTest.h>

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

- (float) xToDeg:(float) x
{
    float result = x - 1;
    result *= -1;
    result *= 90;
    return result;
}

- (void) testInitialsFromFullname {
    NSString *firstNickName = @"EB";
    NSString *expectedResult = @"EB";
   
    XCTAssertEqual(firstNickName, expectedResult, @"Not the same");
}

- (void) testToDeg {
    float firstNickName = [self xToDeg:0.222];
    float expectedResult = 70.02;
    
    XCTAssertEqual(firstNickName, expectedResult, @"Not the same");

     firstNickName = [self xToDeg:0];
     expectedResult = 90;
    
    XCTAssertEqual(firstNickName, expectedResult, @"Not the same");

    
    firstNickName = [self xToDeg:1];
    expectedResult = 0;
    
    XCTAssertEqual(firstNickName, expectedResult, @"Not the same");

}



@end
