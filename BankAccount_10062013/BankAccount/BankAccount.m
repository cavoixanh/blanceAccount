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

-(id) initNewAccountWith:(NSString*)accountNumberNew{
    accountNumber = accountNumberNew;
    return self;
}
@end
