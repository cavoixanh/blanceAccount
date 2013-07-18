//
//  bankAccountTests.m
//  bankAccountTests
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "bankAccountTests.h"
#import "ViewController.h"
#import "bankAccountdao.h"
#import "transactionDAO.h"
#import "bankAccountEntity.h"
#import "transactionEntity.h"
#import <Kiwi/Kiwi.h>

SPEC_BEGIN(bankAccountTest)
describe(@"test bank account", ^{
    
    __block bankAccountdao *dao;
    __block transactionDAO *tranDAO;
    __block ViewController *view;
    __block NSString *accNumber;
    beforeAll(^{
        dao = [[bankAccountdao alloc] init];
        tranDAO = [[transactionDAO alloc] init];
        view = [[ViewController alloc] init];
        //dao = view.dao;
        view.dao = dao;
        view.tranDAO = tranDAO;
        accNumber = @"123456789";
    });
    
    afterAll(^{
        dao = nil;
        tranDAO = nil;
        view = nil;
    });
    
    context(@"test bank account", ^{
        it(@"open new account", ^{
            bankAccountEntity *entity = [[bankAccountEntity alloc] init];
            [dao stub:@selector(insertNewAccount:) andReturn:entity];
            KWCaptureSpy *spy = [dao captureArgument:@selector(insertNewAccount:) atIndex:0];
            [view openNewAccount:accNumber];
            bankAccountEntity * realAccount = spy.argument;
            [[accNumber should] equal:realAccount.accountNumber];
            [[realAccount.balance should] equal:@0];
        });
        
        it(@"get account", ^{
            bankAccountEntity *entity = [[bankAccountEntity alloc] init];
            [dao stub:@selector(getAccount:) andReturn:entity];
            KWCaptureSpy *spy = [dao captureArgument:@selector(getAccount:) atIndex:0];
            [view getAccountWithAccountNumber:accNumber];
            [[accNumber should] equal:spy.argument];
        });
        
        it(@"deposit money", ^{
            bankAccountEntity * entity = [[bankAccountEntity alloc] init];
            entity.balance = @10;
            entity.accountNumber =accNumber;
            NSNumber *money = @50;
            [dao stub:@selector(getAccount:) andReturn:entity];
            KWCaptureSpy *spy = [dao captureArgument:@selector(updateDepositAccount:) atIndex:0];
            [view depositIntoAnAccount:accNumber withMoney:money];
            bankAccountEntity *realAccount = spy.argument;
            [[accNumber should] equal:realAccount.accountNumber];
            [[realAccount.balance should] equal:@60];
        });
        
        it(@"withdraw money", ^{
            bankAccountEntity * entity = [[bankAccountEntity alloc] init];
            entity.balance = @50;
            entity.accountNumber =accNumber;
            NSNumber *money = @10;
            [dao stub:@selector(getAccount:) andReturn:entity];
            KWCaptureSpy *spy = [dao captureArgument:@selector(updateWithdrawAccount:) atIndex:0];
            [view withdrawFromAnAccount:accNumber withMoney:money];
            bankAccountEntity *realAccount = spy.argument;
            [[accNumber should] equal:realAccount.accountNumber];
            [[realAccount.balance should] equal:@40];
        });
        
        it(@"save deposit transaction", ^{
            bankAccountEntity *entity = [[bankAccountEntity alloc] init];
            //NSDate *date = [NSDate nullMock];
            entity.balance = @50;
            entity.accountNumber = accNumber;
            [dao stub:@selector(getAccount:) andReturn:entity];
            KWCaptureSpy *spy = [tranDAO captureArgument:@selector(saveDepositTransaction:) atIndex:0];
            transactionEntity * realTransaction = spy.argument;
            [view depositIntoAnAccount:accNumber withMoney:@50];
            [[accNumber should] equal:realTransaction.accNumber];
            [[realTransaction.amount should] equal:@50];
        });
        
        it(@"save withdraw transaction", ^{
            
        });
    });
    
});

SPEC_END