//
//  BankAccountTestEntity.m
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccountTestEntity.h"
#import "Kiwi.h"
#import "BankAccountEntity.h"

SPEC_BEGIN(BankAccountEntityTest)
describe(@"BankAccountEntity test", ^{
    
    context(@"Test property", ^{
        it(@"accountNumber property is kind of class NSString", ^{
            BankAccountEntity *en = [[BankAccountEntity alloc] init];
            [[theValue([en.accountNumber isKindOfClass:[NSString class]]) should] equal:theValue(YES)];
        });
        
        it(@"balance property is kind of class NSNumber", ^{
            BankAccountEntity *en = [[BankAccountEntity alloc] init];
            [[theValue([en.balance isKindOfClass:[NSNumber class]]) should] equal:theValue(YES)];
        });
        
        it(@"openTimestamp is kind of class NSString", ^{
            BankAccountEntity *en = [[BankAccountEntity alloc] init];
            [[theValue([en.openTimestamp isKindOfClass:[NSString class]]) should] equal:theValue(YES)];
        });
        
        it(@"balance is Equal 0", ^{
            BankAccountEntity *en = [[BankAccountEntity alloc] init];
            [[theValue(en.balance) should]equal:theValue(@0)];
        });
        
                
    });
});
SPEC_END
