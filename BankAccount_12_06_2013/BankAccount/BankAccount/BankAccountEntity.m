//
//  BankAccountEntity.m
//  BankAccount
//
//  Created by Truong Tran  The on 6/12/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccountEntity.h"

@implementation BankAccountEntity
@synthesize accountNumber;
@synthesize openDate;
@synthesize balance;
- (id) init{
    self = [super init];
    if(self){
        accountNumber = [[NSString alloc] init];
        balance = @0;
        openDate = [[NSString alloc] init];
    }
    return self;
}
@end
