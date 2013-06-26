//
//  BankAccountViewController.m
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccountViewController.h"
#import "BankAccountEntity.h"
#import "BankAccountDAO.h"
#import "WithdrawEntity.h"
#import "TransactionEntity.h"
@interface BankAccountViewController ()

@end

@implementation BankAccountViewController
@synthesize bankAccountDAO;
- (id)initWithDAO:(BankAccountDAO*) daoObject{
    self = [super init];
    if(self){
        bankAccountDAO = daoObject;
    }
    return self;
}

- (BankAccountEntity*) getInfo:(NSString*) accountNumber{
    BankAccountEntity *entity = [[BankAccountEntity alloc] init];
    entity = [bankAccountDAO getInformation:accountNumber];
    return entity;
}

-(BankAccountEntity*) openNewAccounntWithAccountNumber:(NSString*) accountNumber{
    BankAccountEntity *entity = [[BankAccountEntity alloc] init];
    entity.accountNumber = accountNumber;
    return entity;
}

-(BankAccountEntity*) CreateNewAccount:(NSString*) accountNumber{
    BankAccountEntity *entity = [self openNewAccounntWithAccountNumber:accountNumber];
    entity  = [bankAccountDAO insertAccountToDB:entity];
    return entity;
}

- (TransactionEntity*) deposit:(NSString*) accountNumber withMoney:(NSNumber*) money{
   
    TransactionEntity *transactionEntity = [[TransactionEntity alloc] init];
    transactionEntity = [bankAccountDAO deposit:accountNumber withMoney:money];
    transactionEntity.amount = money;
    
    return transactionEntity;
}

- (TransactionEntity*) getTimeStampWhenDepositAndSaveToDB:(BankAccountEntity*) entity{
    TransactionEntity * entity1 = [[TransactionEntity alloc] init];
    entity1 = [bankAccountDAO getTimeStampWhenDeposit:entity];
    return entity1;
}

- (TransactionEntity*) withdraw:(NSString*)accountNumber withMoney:(NSNumber*) moneyWithdraw {
    TransactionEntity *entity = [[TransactionEntity alloc] init];
    entity.amount = moneyWithdraw;
    entity = [self saveInforWithdraw:entity];
    
    return entity;
}

- (TransactionEntity*) saveInforWithdraw:(TransactionEntity*)entity{

    TransactionEntity *withEntity = [[TransactionEntity alloc]init];
    withEntity.accountNumber = entity.accountNumber;
    withEntity.amount = entity.amount;
    withEntity = [bankAccountDAO saveInforWithdraw:withEntity];
    return withEntity;
}
@end
