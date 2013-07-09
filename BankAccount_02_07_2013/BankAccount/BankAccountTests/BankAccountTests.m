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
        view = nil;
    });
    
    context(@"tests", ^{
        
        it(@"open Account ", ^{
            BankAccountEntity *entity = [BankAccountEntity nullMock];
            NSString * accountNumber = @"123456789";
            [dao stub:@selector(insertNewAccountToDB:) andReturn:entity];
            KWCaptureSpy *spy = [dao captureArgument:@selector(insertNewAccountToDB:) atIndex:0];
            entity = spy.argument;
            [view openAccountWithAccountNumber: accountNumber];
            
            [[entity.accountNumber should] equal:accountNumber];
            [[entity.balance should] equal:@0];
           
        });
        
        it(@"get Account",^{
            BankAccountEntity *entity = [BankAccountEntity nullMock];
            NSString * accountNumber = [NSString nullMock];
            [dao stub:@selector(getAccountFromDB:) andReturn:entity ];
            KWCaptureSpy *spy = [dao captureArgument:@selector(getAccountFromDB:) atIndex:0];
            [view getAccountWithAccountNumber:accountNumber];
            [[accountNumber should] equal:spy.argument];
        });
        
        it(@"deposit money into account and save into db", ^{
            BankAccountEntity * entity = [[BankAccountEntity alloc] init];
            entity.accountNumber = @"123456789";
            entity.balance = @10;
            NSNumber *amount = @5;
            TransactionEntity * trEntity = [[TransactionEntity alloc] init];
            TransactionEntity * expect ;
            [dao stub:@selector(getAccountFromDB:) andReturn:entity withArguments:entity.accountNumber];
            [dao stub:@selector(updateAccountInDB:) andReturn:@1 ];
            [dao stub:@selector(insertTransactionInDB:) andReturn:trEntity];
            
            KWCaptureSpy * spy = [dao captureArgument:@selector(updateAccountInDB:) atIndex:0];
            KWCaptureSpy * spy1 = [dao captureArgument:@selector(insertTransactionInDB:) atIndex:0];
            
            expect = [view DepositMoney:entity.accountNumber :amount];
            [[entity.accountNumber should] equal:spy.argument];
            
            trEntity = spy1.argument;
            [[expect.amount should] equal:trEntity.amount];
            
        });
        
        it(@"withdraw money and save into db", ^{
            BankAccountEntity * entity = [[BankAccountEntity alloc] init];
            entity.accountNumber = @"123456789";
            entity.balance = @10;
            NSNumber *amount = @5;
            TransactionEntity * trEntity = [[TransactionEntity alloc] init];
            TransactionEntity * expect ;
            [dao stub:@selector(getAccountFromDB:) andReturn:entity withArguments:entity.accountNumber];
            [dao stub:@selector(updateAccountInDB:) andReturn:@1 ];
            [dao stub:@selector(insertTransactionInDB:) andReturn:trEntity];
            
            KWCaptureSpy * spy = [dao captureArgument:@selector(updateAccountInDB:) atIndex:0];
            KWCaptureSpy * spy1 = [dao captureArgument:@selector(insertTransactionInDB:) atIndex:0];
            
            expect = [view withdrawMoney:entity.accountNumber :amount];
            [[entity.accountNumber should] equal:spy.argument];
            
            trEntity = spy1.argument;
            [[expect.amount should] equal:trEntity.amount];

        });
        
        it(@"get list transaction", ^{
            NSString *accNumber = @"123456789";
            NSArray * list = [NSArray nullMock];
            [dao stub:@selector(getListTransactionWithAcc:) andReturn:list];
            KWCaptureSpy *spy = [dao captureArgument:@selector(getListTransactionWithAcc:) atIndex:0];
            [view getAccountWithAccountNumber:accNumber];
            
            [[accNumber should]equal:spy.argument];
        });
        it(@"get list transaction in ranger", ^{
            NSString *accNumber = @"123456789";
            NSArray * list = [NSArray nullMock];
            NSDate *startDate = [NSDate nullMock];
            NSDate *endDate = [NSDate nullMock];
            
            [dao stub:@selector(getListTransactionWithAcc:) andReturn:list];
            KWCaptureSpy *spy = [dao captureArgument:@selector(getListTransactionWithAccountNumber:andStart:end:) atIndex:0];
            KWCaptureSpy *spy1 = [dao captureArgument:@selector(getListTransactionWithAccountNumber:andStart:end:) atIndex:1];
            KWCaptureSpy *spy2 = [dao captureArgument:@selector(getListTransactionWithAccountNumber:andStart:end:) atIndex:2];
            
            [view getListTransactionWithAccountNumber:accNumber andStart:startDate end:endDate];
            
            [[accNumber should]equal:spy.argument];
            [[startDate should] equal:spy1.argument];
            [[endDate should] equal:spy2.argument];
        });
         it(@"get list n transaction", ^{
             NSString *accNumber = @"123456789";
             NSNumber * number = @10;
             NSArray *list = [NSArray nullMock];
             
             [dao stub:@selector(getListTransactionWithAcc:andN:) andReturn:list];
             KWCaptureSpy  *spy = [dao captureArgument:@selector(getListTransactionWithAcc:andN:) atIndex:0];
             KWCaptureSpy  *spy1 = [dao captureArgument:@selector(getListTransactionWithAcc:andN:) atIndex:1];
             [view getListTransactionWithAccountNumber:accNumber andN:number];
             
             [[accNumber should] equal:spy.argument];
             [[number should] equal:spy1.argument];
         });
    });
});
SPEC_END


