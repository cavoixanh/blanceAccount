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
    __block ViewController *view;
    __block NSString *accNumber;
    beforeAll(^{
        dao = [[bankAccountdao alloc] init];
        view = [[ViewController alloc] init];
        //dao = view.dao;
        view.dao = dao;
        accNumber = @"123456789";
    });
    
    afterAll(^{
        dao = nil;
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
            
        });
    });
    
});

SPEC_END