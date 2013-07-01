//
//  BankAccountTestDAO.m
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "Kiwi.h"
#import "BankAccountDAO.h"
#import "BankAccountEntity.h"
#import "WithdrawEntity.h"
#import "TransactionEntity.h"
#import "BankAccountViewController.h"

SPEC_BEGIN(BankAccountTestDAO){
    describe(@"Bank Account Test", ^{
        __block BankAccountViewController *viewCotroller;
        __block BankAccountDAO    *daoMock;
    
        beforeEach(^{
            daoMock = [BankAccountDAO nullMock];
            viewCotroller = [[BankAccountViewController alloc] initWithDAO:daoMock];
            
        });
        afterEach(^{
            viewCotroller = nil;
            daoMock = nil;
        });
    
        context(@"test init DAO", ^{
        
            it(@"test initwithDAO", ^{
                [[viewCotroller.bankAccountDAO should] equal:daoMock];
            });
            
            it(@"test create new Account to insert into DB", ^{
                NSString * accountNumberMock = [NSString nullMock];
                BankAccountEntity * entityMock = [BankAccountEntity nullMock];
                BankAccountEntity * expect;
                
                [[viewCotroller should] receive:@selector(openNewAccounntWithAccountNumber:) andReturn:entityMock withArguments:accountNumberMock];
                [daoMock stub:@selector(insertAccountToDB:) andReturn:entityMock withArguments:entityMock];
                
                expect = [viewCotroller CreateNewAccount:accountNumberMock];
                [[expect should] equal:entityMock];
            });
            
            it(@"test balance equal 0", ^{
                NSString * accountNumberMock = [NSString nullMock];
                //BankAccountEntity * entityMock = [BankAccountEntity nullMock];
                BankAccountEntity * expect ;
                
                //[daoMock stub:@selector(insertAccountToDB:) andReturn:entityMock withArguments:entityMock];
                expect = [viewCotroller openNewAccounntWithAccountNumber:accountNumberMock];
                [[expect.balance should] equal:@0];
             });
            
            it(@"get information", ^{
                NSString * accountNumberMock = [NSString nullMock];
                BankAccountEntity * entityMock = [BankAccountEntity nullMock];
                BankAccountEntity * expect  = [[BankAccountEntity alloc] init];
                
                [[viewCotroller should] receive:@selector(getInfo:) andReturn:entityMock withArguments:accountNumberMock];
                [daoMock stub:@selector(getInformation:) andReturn:entityMock withArguments:accountNumberMock];
                expect = [viewCotroller getInfo:accountNumberMock];
                [[expect should] equal:entityMock];
            });
            
            it(@"deposit account", ^{
                NSString * accountNumberMock = [NSString nullMock];
                NSNumber * money = [NSNumber nullMock];

                TransactionEntity * transactionEntity = [[TransactionEntity alloc]init];
                TransactionEntity *expect = [[TransactionEntity alloc] init];
                [daoMock stub:@selector(deposit:withMoney:) andReturn:transactionEntity withArguments:accountNumberMock,money];
                
                expect = [viewCotroller deposit:accountNumberMock withMoney:money];
                [[money should] equal:expect.amount];
                
            });
            
            it(@"get timestamp when deposit", ^{
                //NSString * accountNumberMock = [NSString nullMock];
                //NSNumber * money = [NSNumber nullMock];
                BankAccountEntity *entityMock = [[BankAccountEntity alloc]init];
                TransactionEntity *expect;
                TransactionEntity *trasactionentity = [TransactionEntity nullMock];
                
                [daoMock stub:@selector(getTimeStampWhenDeposit:) andReturn:trasactionentity withArguments:entityMock];
                
                expect =  [viewCotroller getTimeStampWhenDepositAndSaveToDB:entityMock];
                [[expect should] equal:trasactionentity];
            });
            
            it(@"withdraw money", ^{
                
                NSNumber * moneyWidraw = @10;
                //NSString * accountNumberMock = [NSString nullMock];
                BankAccountEntity *account = [[BankAccountEntity alloc] init];
                TransactionEntity *tranWith = [[TransactionEntity alloc] init];
                account.balance = @100;
                NSNumber * balanceBeforeWithdraw = account.balance;
                [[daoMock should] receive:@selector(insertTransactionWithDrawIntoDB:) andReturn:tranWith withArguments:tranWith];
                KWCaptureSpy *spy = [daoMock captureArgument:@selector(updateAccount:) atIndex:0];
                BankAccountEntity * accountAfterWith = spy.argument;
                [[accountAfterWith.balance should] equal:(@(balanceBeforeWithdraw.doubleValue - moneyWidraw.doubleValue))];
                
             });
            it(@"lis transactions", ^{
                NSNumber *accountNumber = @123456789;
                NSArray *listTransactionMock = [[NSArray alloc] init];
                [[daoMock should] receive:@selector(getTransactionFromDB:) andReturn:listTransactionMock withArguments:accountNumber];
                KWCaptureSpy *spy = [daoMock captureArgument:@selector(getTransactionFromDB:) atIndex:0];
                [viewCotroller getTransaction:accountNumber];
                [[accountNumber should] equal:spy.argument];
            });
            
            it(@"list transactions in range", ^{
                NSNumber *accountNumber = @123456789;
                NSDate  *startDate = [NSDate nullMock];
                NSDate  *endDate = [NSDate nullMock];
                NSArray *listTransaction = [NSArray nullMock];
                [[daoMock should] receive:@selector(getTransactionInRangeFromDB:::) andReturn:listTransaction withArguments:accountNumber,startDate,endDate];
                KWCaptureSpy *spy = [daoMock captureArgument:@selector(getTransactionInRangeFromDB:::) atIndex:0];
                KWCaptureSpy *spy1 = [daoMock captureArgument:@selector(getTransactionInRangeFromDB:::) atIndex:1];
                KWCaptureSpy *spy2 = [daoMock captureArgument:@selector(getTransactionInRangeFromDB:::) atIndex:2];
                [viewCotroller getTransaction:accountNumber];
                [[accountNumber should] equal:spy.argument];
                [[startDate should] equal:spy1.argument];
                [[endDate should] equal:spy2.argument];
            });
            
            it(@"get n transaction which newest", ^{
                NSNumber *accountNumber = @123456;
                NSNumber *n = @10;
                
                NSArray *listTransaction = [NSArray nullMock];
                [[daoMock should] receive:@selector(getNTransactionFromDB::) andReturn:listTransaction withArguments:accountNumber,n];
                KWCaptureSpy *spy = [daoMock captureArgument:@selector(getNTransactionFromDB::) atIndex:0];
                KWCaptureSpy *spy1 = [daoMock captureArgument:@selector(getNTransactionFromDB::) atIndex:1];
                [viewCotroller getNTransaction:accountNumber :n];
                [[accountNumber should] equal:spy.argument];
                [[n should] equal:spy1.argument];
            });

        });
    });

}
SPEC_END