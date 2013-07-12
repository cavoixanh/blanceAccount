//
//  BankAccountTests.m
//  BankAccountTests
//
//  Created by Truong Tran  The on 7/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//
#import "BankAccountTests.h"
#import "BankAccountEntity.h"
#import "TransactionEntity.h"
#import "BankAccountDAO.h"
#import "TransactionDAO.h"
#import "ViewController.h"
#import <Kiwi/Kiwi.h>

SPEC_BEGIN(test)
describe(@"Test Bank Acc", ^{
    __block BankAccountEntity * bankAccountEntity;
    __block BankAccountDAO    * bankAccountDAO;
    __block TransactionEntity * transactionEntity;
    __block TransactionDAO    * transactionDAO;
    __block ViewController    * view;
    
    beforeAll(^{
        bankAccountEntity = [[BankAccountEntity alloc] init];
        bankAccountDAO    = [[BankAccountDAO alloc] init];
        view              = [[ViewController alloc] init];
        transactionDAO    = [[TransactionDAO alloc] init];
        transactionEntity = [[TransactionEntity alloc] init];
        view.dao = bankAccountDAO;
    });
    
    afterAll(^{
        bankAccountDAO = nil;
        bankAccountEntity = nil;
        view = nil;
    });
    
    context(@"Test bank acc", ^{
        it(@"Test open account", ^{
            NSString * accNumber = @"123456789";
            BankAccountEntity *entity ;
            [bankAccountDAO stub:@selector(insertAnAccount:) andReturn: bankAccountEntity];
            KWCaptureSpy *spy = [bankAccountDAO captureArgument:@selector(insertAnAccount:) atIndex:0];
            [view openNewAccountWithAccNumber:accNumber];
            entity = spy.argument;
            [[entity.balance should] equal:@0];
            [[entity.accountNumber should] equal:accNumber];
        });
        
        it(@"Test get account", ^{
            NSString * accNumber = @"123456789";
            [bankAccountDAO stub: @selector(getAccountWithAccNumber:) andReturn:bankAccountEntity];
            KWCaptureSpy *spy = [bankAccountDAO captureArgument:@selector(getAccountWithAccNumber:) atIndex:0];
            [view getAccountWithAccNumber:accNumber];
            [[spy.argument should] equal:accNumber];
        });
        
        it(@"Deposit money into account", ^{
            NSString *accNumber = @"123456789";
            NSNumber *depositMoney = @10;
            bankAccountEntity.balance = @20;
            bankAccountEntity.accountNumber = accNumber;
            
            [bankAccountDAO stub:@selector(getAccountWithAccNumber:) andReturn:bankAccountEntity];
            KWCaptureSpy *spy = [transactionDAO captureArgument:@selector(depositMoneyIntoAccount:) atIndex:0];
            [view depositMoneyIntoAccount:accNumber withMoney:depositMoney];
            bankAccountEntity = spy.argument;
            [[bankAccountEntity.balance should]equal:@30];
        });
    });
});

SPEC_END
