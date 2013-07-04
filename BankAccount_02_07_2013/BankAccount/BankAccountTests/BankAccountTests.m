//
//  BankAccountTests.m
//  BankAccountTests
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccountTests.h"
#import "BankAccountEntity.h"
#import "TransactionEntity.h"
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
            KWCaptureSpy *spy = [dao captureArgument:@selector(insertNewAccountToDB:) atIndex:0];
            entity = spy.argument;
            [view openAccountWithAccountNumber: accountNumber];
            
            [[entity.accountNumber should] equal:accountNumber];
            [[entity.balance should] equal:@0];
           
        });
        
        it(@"get Account",^{
            BankAccountEntity *entity = [[BankAccountEntity alloc] init];
            NSString * accountNumber = [NSString nullMock];
            [dao stub:@selector(getAccountFromDB:) andReturn:entity withArguments:accountNumber];
            KWCaptureSpy *spy = [dao captureArgument:@selector(getAccountFromDB:) atIndex:0];
            [[accountNumber should] equal:spy.argument];
        });
        
        it(@"deposit money into account", ^{
            BankAccountEntity * entity = [[BankAccountEntity alloc] init];
            entity.accountNumber = @"123456789";
            entity.balance = @10;
            NSNumber *amount = @5;
            TransactionEntity * trEntity = [[TransactionEntity alloc] init];
            [dao stub:@selector(getAccountFromDB:) andReturn:entity withArguments:@"123456789"];
            [dao stub:@selector(updateAccountInDB:) andReturn:@1 withArguments:entity];
            [dao stub:@selector(insertTransactionInDB:) andReturn:trEntity withArguments:trEntity];
            
            KWCaptureSpy * spy = [dao captureArgument:@selector(updateAccountInDB:) atIndex:0];
            KWCaptureSpy * spy1 = [dao captureArgument:@selector(insertTransactionInDB:) atIndex:0];
            
            [view DepositMoney:entity.accountNumber :amount];
            trEntity = spy1.argument;
            [[entity.accountNumber should] equal:spy.argument];
            [[amount should] equal:trEntity.amount];
            
        });
    });
});


SPEC_END


