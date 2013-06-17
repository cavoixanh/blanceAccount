//
//  StackClass.h
//  StackClass
//
//  Created by Truong Tran  The on 6/17/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StackClass : NSObject

@property(nonatomic, strong) NSMutableArray * stackManager;

- (void)addMoreObject:(NSString*) anObject;
- (id)initWithKObject:(NSInteger)k;
- (NSObject*)top;
@end
