//
//  BankAccountTests.m
//  BankAccountTests
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccountTests.h"
#import "BankAccountEntity.h"
#import "BankAccountDAO.h"
#import "BankAccountViewController.h"

SPEC_BEGIN(BankAccountTest)
describe(@"Test bank account", ^{
    __block  BankAccountDAO *dao;
    __block  BankAccountViewController *view;
    beforeAll(^{
        dao = [[BankAccountDAO alloc] init];
        view = [[BankAccountViewController alloc] init];
    });
    afterAll(^{
        dao = nil;
    });
    
    context(@"", ^{
        it(@"open Account ", ^{
            BankAccountEntity *entity = [[BankAccountEntity alloc] init];
            NSString * accountNumber = @"123456789";
            [dao stub:@selector(insertNewAccountToDB:) andReturn:entity withArguments:entity];
            [view openAccountWithAccountNumber: accountNumber];
            KWCaptureSpy *spy = [dao captureArgument:@selector(insertNewAccountToDB:) atIndex:0];
            entity = spy.argument;
            [[entity.accountNumber should] equal:accountNumber];
            [[entity.balance should] equal:@0];
           
        });
    });
});


SPEC_END


