//
//  BankAccount.m
//  BankAccount
//
//  Created by Truong Tran  The on 6/10/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccount.h"

@implementation BankAccount
@synthesize accountNumber;
@synthesize balance;
@synthesize openTimestamp;

- (id)init{
    self = [super init];
    if(self){
        accountNumber = [[NSString alloc] init];
        balance = 0;
        openTimestamp = [[NSString alloc] init];
    }
    
    return self;
}
@end
