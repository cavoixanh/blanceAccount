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
        view.daoTran = transactionDAO;
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
        
        it(@"Deposit money into account and save transaction", ^{
            NSString *accNumber = @"123456789";
            NSNumber *depositMoney = @10;
            bankAccountEntity.balance = @20;
            NSDate *date = [NSDate nullMock];
            bankAccountEntity.accountNumber = accNumber;
            
            [bankAccountDAO stub:@selector(getAccountWithAccNumber:) andReturn:bankAccountEntity];
            [transactionDAO stub:@selector(depositMoneyIntoAccount:) andReturn:transactionEntity];
            [transactionEntity stub:@selector(setDate:) withArguments:date];
            KWCaptureSpy *spy = [transactionDAO captureArgument:@selector(depositMoneyIntoAccount:) atIndex:0];
            KWCaptureSpy *spy1 = [transactionDAO captureArgument:@selector(saveDepositTransaction:) atIndex:0];
            [view depositMoneyIntoAccount:accNumber withMoney:depositMoney];
            bankAccountEntity = spy.argument;
            transactionEntity = spy1.argument;
            //[[transactionEntity.date should] equal:date];
            [[bankAccountEntity.balance should]equal:@30];
            [[transactionEntity.amount should] equal:@30];
            [[transactionEntity.accNumber should ] equal:accNumber];
            
        });
        
        it(@"Withdraw money from account and save transaction", ^{
            NSString *accNumber = @"123456789";
            NSNumber *withdrawMoney = @10;
            NSDate *date = [NSDate nullMock];
            bankAccountEntity.balance = @20;
            bankAccountEntity.accountNumber = accNumber;
            
            [bankAccountDAO stub:@selector(getAccountWithAccNumber:) andReturn:bankAccountEntity];
            [transactionDAO stub:@selector(withdrawMoneyFromAccount:) andReturn:transactionEntity];
            [transactionEntity stub:@selector(setDate:) withArguments:date ];
            KWCaptureSpy *spy = [transactionDAO captureArgument:@selector(withdrawMoneyFromAccount:) atIndex:0];
            KWCaptureSpy *spy1 = [transactionDAO captureArgument:@selector(saveWithdrawTransaction:) atIndex:0];
            [view withdrawMoneyFromAccount:accNumber withMoney:withdrawMoney];
            bankAccountEntity = spy.argument;
            transactionEntity = spy1.argument;
            //[[transactionEntity.date should] equal:date];
            [[bankAccountEntity.balance should]equal:@10];
        });
    });
});

SPEC_END
