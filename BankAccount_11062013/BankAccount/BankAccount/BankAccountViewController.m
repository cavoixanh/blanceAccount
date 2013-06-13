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

-(BankAccountEntity*) openNewAccounntWithAccountNumber:(NSString*) accountNumber{
    BankAccountEntity *entity = [[BankAccountEntity alloc] init];
    entity.accountNumber = accountNumber;
    entity.balance = @0;
    return entity;

}
-(BankAccountEntity*) CreateNewAccount:(NSString*) accountNumber{
    BankAccountEntity *entity = [self openNewAccounntWithAccountNumber:accountNumber];
    BankAccountDAO    *dao = [[BankAccountDAO alloc] init];
    //entity  = [dao insertAccountToDB:entity];
    
    return entity;
}

@end
