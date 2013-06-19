//
//  StackClassTests.m
//  StackClassTests
//
//  Created by Truong Tran  The on 6/17/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "StackClassTests.h"
#import "StackClass.h"
@implementation StackClassTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    //STFail(@"Unit tests are not implemented yet in StackClassTests");
    StackClass *stack = [[StackClass alloc] init];
    NSLog(@"count = %d",[stack.stackManager count]);
    NSNumber * numberOfStach = [NSNumber numberWithInteger:[stack.stackManager count]];
    STAssertEquals(numberOfStach, @0, @"test stack size");
    
    NSString *anObject = @"test2";
    [stack addMoreObject:anObject];
    numberOfStach = [NSNumber numberWithInteger:[stack.stackManager count]];
    STAssertEquals( numberOfStach, @1, @"push an Object");
    
    StackClass *stack2 = [[StackClass alloc] initWithKObject:5];
    [stack2 addMoreObject:anObject];
    numberOfStach = [NSNumber numberWithInteger:[stack2.stackManager count]];
    STAssertEquals(numberOfStach, @6, @"push more an Object");
    
    StackClass *stack3 = [[StackClass alloc] init];
    NSString *obj = [stack3 top];
    STAssertEquals(obj, nil, @"check Object top nil");
    
}

@end
