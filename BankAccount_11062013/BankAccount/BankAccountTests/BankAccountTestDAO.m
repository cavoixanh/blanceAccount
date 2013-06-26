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
                NSString * accountNumberMock = [NSString nullMock];
                NSNumber * moneyWidraw = [NSNumber nullMock];
                TransactionEntity * transactionEntity = [[TransactionEntity alloc] init];
                TransactionEntity *expect;
                [daoMock stub:@selector(saveInforWithdraw:) andReturn:transactionEntity withArguments:transactionEntity];
                expect = [viewCotroller withdraw:accountNumberMock withMoney:moneyWidraw];
                [[moneyWidraw should] equal:expect.amount];
             });
            
            it(@"save amount, timestamp, accountNumber to DB", ^{
//                NSString * accountNumberMock = [NSString nullMock];
//                BankAccountEntity *entityMock = [BankAccountEntity nullMock];
//                WithdrawEntity * withEntityMock = [[WithdrawEntity alloc] init];
//                WithdrawEntity *expect;
//                
//               [daoMock stub:@selector(getInformation:) andReturn:entityMock withArguments:accountNumberMock];
//               [daoMock stub:@selector(saveInforWithdraw:) andReturn:withEntityMock withArguments:withEntityMock];
//                [viewCotroller saveInforWithdraw:withEntityMock];
//            
//                expect = [viewCotroller saveInforWithdraw:withEntityMock];
//                [[withEntityMock should] equal:expect.amount];
            });
        });
    });

}
SPEC_END