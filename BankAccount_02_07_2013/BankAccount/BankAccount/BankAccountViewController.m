//
//  BankAccountViewController.m
//  BankAccount
//
//  Created by Truong Tran  The on 6/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "BankAccountViewController.h"
#import "BankAccountDAO.h"
#import "BankAccountEntity.h"
@interface BankAccountViewController (){
    BankAccountDAO *dao;
}

@end

@implementation BankAccountViewController

-(id)init{
    self = [super init];
    if(self){
        dao = [[BankAccountDAO alloc] init];
    }
    return self;
}

-(void) openAccountWithAccountNumber:(NSString*) accountNumber{
    BankAccountEntity *entity = [[BankAccountEntity alloc] init];
    entity.accountNumber = accountNumber;
    entity.balance = @0;
    entity.openTimeStamp = [NSDate date];
    [dao insertNewAccountToDB:entity];
}

-(BankAccountEntity*) getAccountWithAccountNumber:(NSString *) accountNumber{
    BankAccountEntity *entity = [[BankAccountEntity alloc] init];
    entity = [dao getAccountFromDB:accountNumber];
    return entity;
}
-(TransactionEntity*) DepositMoney:(NSString*) accountNumber : (NSNumber *) money{
    BankAccountEntity *entity = [dao getAccountFromDB:accountNumber];
    TransactionEntity *tranEntity = [[TransactionEntity alloc] init];
    if(entity){
        entity.balance = @(entity.balance.doubleValue + money.doubleValue);
        if([dao updateAccountInDB:entity]){
            tranEntity.accountNumber = accountNumber;
            tranEntity.amount = money;
            tranEntity.description = @""; 
            tranEntity.type = @1;
            [dao insertTransactionInDB:tranEntity];
        }
    }
    return tranEntity;
}

-(TransactionEntity*) withdrawMoney:(NSString*) accountNumber :(NSNumber *) money{
    BankAccountEntity * entity = [dao getAccountFromDB:accountNumber];
    TransactionEntity *tranEntity = [[TransactionEntity alloc] init];
    if(entity){
        entity.balance = @(entity.balance.doubleValue + money.doubleValue);
        if([dao updateAccountInDB:entity]){
            tranEntity.accountNumber = accountNumber;
            tranEntity.amount = money;
            tranEntity.description = @"";
            tranEntity.type = @-1;
            [dao insertTransactionInDB:tranEntity];
        }
    }
    return tranEntity;
}

-(NSArray*) getListTransactionWithAccountNumber:(NSString *) accountNumber{
    NSArray * listTransaction = [dao getListTransactionWithAcc:accountNumber];
    return listTransaction;
}
-(NSArray*) getListTransactionWithAccountNumber:(NSString *) accountNumber andStart:(NSDate*)startDate end:(NSDate*)endDate{
    NSArray * listTransaction = [dao getListTransactionWithAcc:accountNumber andStart:startDate end:endDate];
    return listTransaction;
}
-(NSArray*) getListTransactionWithAccountNumber:(NSString *)accountNumber andN:(NSNumber*)number{
    NSArray * listTransaction = [dao getListTransactionWithAcc:accountNumber andN:number];
    return listTransaction;
}

@end
