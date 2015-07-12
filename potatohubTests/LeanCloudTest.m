//
//  LeanCloudTest.m
//  potatohub
//
//  Created by Yan Gao on 7/13/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <AVObject.h>

@interface LeanCloudTest : XCTestCase

@end

@implementation LeanCloudTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCanInsertObjectIntoLeanCloud {
    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
