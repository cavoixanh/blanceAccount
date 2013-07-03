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
    [dao insertNewAccountToDB:entity];
}
@end
