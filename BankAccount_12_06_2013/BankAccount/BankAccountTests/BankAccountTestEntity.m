//
//  BankAccountTestEntity.m
//  BankAccount
//
//  Created by Truong Tran  The on 6/12/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccountTestEntity.h"
#import "Kiwi.h"
#import "BankAccountEntity.h"

SPEC_BEGIN(BankAccountTestEntity){

    it(@"test Entity accountNumber is NSString class", ^{
        BankAccountEntity * newAccount = [[BankAccountEntity alloc] init];
        [[theValue([newAccount.accountNumber isKindOfClass:[NSString class]]) should] equal:YES];
    });
    
    it(@"test Entity balance is NSNumber, balance = 0", ^{
        BankAccountEntity *newAccount = [[BankAccountEntity alloc] init];
        [[theValue([newAccount.balance isKindOfClass:[NSNumber class]]) should] equal:YES];
        [[theValue(newAccount.balance) should] equal:@0];
    });
    
    it(@"test Entity open date is NSString", ^{
        BankAccountEntity *newAccount = [[BankAccountEntity alloc] init];
        [[theValue([newAccount.openDate isKindOfClass:[NSString class]]) should] equal:YES];
    });
    
}
SPEC_END