//
//  StackClass.m
//  StackClass
//
//  Created by Truong Tran  The on 6/17/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "StackClass.h"

@implementation StackClass
@synthesize stackManager;

-(id)init{
    self = [super init];
    if(self){
        stackManager = [[NSMutableArray alloc] initWithObjects:nil];
        
    }
    return self;
}

- (id)initWithKObject:(NSInteger)k{
    self = [super init];
    if(self){
        stackManager = [[NSMutableArray alloc] init];
        for(NSInteger i = 0; i< k ; i++){
            NSString *string = [NSString stringWithFormat:@"k"];
            [stackManager addObject:string];
        }
    }
    return self;

}

-(void)addMoreObject:(NSString*) anObject{
    [stackManager addObject:anObject];
}

-(NSObject*)top{
    NSObject * lastObj = [stackManager lastObject];
    return lastObj;
}
@end
