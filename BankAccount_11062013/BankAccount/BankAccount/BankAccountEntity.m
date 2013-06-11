//
//  BankAccountEntity.m
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccountEntity.h"

@implementation BankAccountEntity
@synthesize accountNumber;
@synthesize openTimestamp;
@synthesize balance;

-(id)init{
    self = [super init];
    
    if(self){
        accountNumber = [[NSString alloc] init];
        openTimestamp = [[NSString alloc] init];
        balance = @0;
    }
    
    return self;
}
@end
