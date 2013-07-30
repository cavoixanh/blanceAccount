//
//  ViewController.m
//  SingleLinkedList
//
//  Created by Truong Tran  The on 7/30/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "SingleLinkedList.h"

@interface SingleLinkedList ()

@end

@implementation SingleLinkedList
@synthesize array;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id)init{
    self = [super init];
    if (self) {
        array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSInteger)getSize{
    return [array count];
}
- (void)insertAfter:(NSInteger)index Object:(NSNumber*)node{
    [array insertObject:node atIndex:index];
}
- (void)deleteNode:(NSInteger)index{
    [array removeObjectAtIndex:index];
}

- (NSNumber*)first{
    NSNumber *head = [array objectAtIndex:0];
    return head;
}
- (NSNumber*)last{
    NSNumber *last = [array lastObject];
    return last;
}
- (NSNumber*)before:(NSInteger)index{
    return [array objectAtIndex:(index -1) ];
}

- (NSNumber*)after:(NSInteger)index{
    return [array objectAtIndex:(index + 1) ];
}
- (NSInteger)findObject:(NSNumber *)node{
    for(NSNumber *number in array){
        if([number isEqualToNumber:node])
            return [array indexOfObject:number];
    }
    return -1;
}
- (void)append:(NSNumber*)node{
    [array addObject:node];
}
- (void)insertFirst:(NSNumber*)node{
    [array insertObject:node atIndex:0];
}
@end
