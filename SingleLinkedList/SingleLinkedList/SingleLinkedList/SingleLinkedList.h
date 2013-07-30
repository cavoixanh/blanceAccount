//
//  ViewController.h
//  SingleLinkedList
//
//  Created by Truong Tran  The on 7/30/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleLinkedList : UIViewController

@property(nonatomic, strong) NSMutableArray *array;
- (NSInteger)getSize;
- (void)insertAfter:(NSInteger)index Object:(NSNumber*)node;
- (void)deleteNode:(NSInteger)index;
- (NSNumber*)first;
- (NSNumber*)last;
- (NSNumber*)before:(NSInteger)index;
- (NSNumber*)after:(NSInteger)index;
- (NSInteger)findObject:(NSNumber *)node;
- (void)append:(NSNumber*)node;
- (void)insertFirst:(NSNumber*)node;
@end
