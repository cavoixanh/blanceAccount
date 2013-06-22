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

- (BankAccountEntity*) deposit:(NSString*) accountNumber withMoney:(NSNumber*) money{
    BankAccountEntity *entity = [bankAccountDAO deposit:accountNumber withMoney:money];
    entity = [self getTimeStampWhenDepositAndSaveToDB:entity];
    return entity;
}

- (BankAccountEntity*) getTimeStampWhenDepositAndSaveToDB:(BankAccountEntity*) entity{
    entity = [bankAccountDAO getTimeStampWhenDeposit:entity];
    return entity;
}

- (BankAccountEntity*) withdraw:(NSString*)accountNumber withMoney:(NSNumber*) moneyWithdraw {
    BankAccountEntity *entity = [bankAccountDAO getInformation:accountNumber];
    double money =  [entity.balance doubleValue] - [moneyWithdraw doubleValue];
    entity.balance = [NSNumber numberWithDouble:money];
    entity.amount  = moneyWithdraw;
    
    //WithdrawEntity *withEntity = [self saveInforWithdraw:entity];
    return entity;
}

- (WithdrawEntity*) saveInforWithdraw:(BankAccountEntity*)entity{

    WithdrawEntity *withEntity;
    withEntity.accountNumber = entity.accountNumber;
    withEntity.amount = entity.amount;
    withEntity = [bankAccountDAO saveInforWithdraw:withEntity];
    return withEntity;
}
@end
