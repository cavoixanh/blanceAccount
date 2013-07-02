//
//  BankAccountTests.m
//  BankAccountTests
//
//  Created by Truong Tran  The on 7/2/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccountTests.h"
#import "BankAccount.h"
#import "BankAccountDAO.h"
#import "ViewController.h"
#import "Kiwi.h"

SPEC_BEGIN(BankAccountTests){
    describe(@"test bank account", ^{
        
            __block ViewController  * view;
            __block BankAccountDAO * accountDAO;
            __block BankAccount    * accountentity;
            beforeAll(^{
                view = [[ViewController alloc] init];
                accountDAO = [[BankAccountDAO alloc] init];
                accountentity = [[BankAccount alloc] init];
            });
            afterAll(^{
                accountDAO = nil;
            });
        
        context(@"", ^{
            it(@"1. open Account with AccountNumber: balance = 0", ^{
                NSString * accountNumber = @"123456789";
                BankAccount *expectAccount = [[BankAccount alloc] init];
                [accountDAO stub:@selector(insertNewAccount:) andReturn:accountentity withArguments:accountentity];
                KWCaptureSpy *spy = [KWCaptureSpy captureArgument:@selector(insertNewAccount:) atIndex:0];
                accountentity = [view openAccountWithNumber:accountNumber];
                
                expectAccount = spy.argument;
                [[expectAccount.balance should] equal:@0];
                [[expectAccount should] equal:accountentity];
            });
        });
    });
}

SPEC_END
