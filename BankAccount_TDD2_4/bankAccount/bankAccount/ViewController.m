//
//  ViewController.m
//  bankAccount
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "ViewController.h"
#import "bankAccountEntity.h"
#import "transactionEntity.h"
@interface ViewController (){
    
    bankAccountEntity * accountEntity;
    transactionEntity * tranEntity;
}

@end

@implementation ViewController
@synthesize dao;
@synthesize tranDAO;
- (void)viewDidLoad
{
    [super viewDidLoad];
    dao = [[bankAccountdao alloc] init];
    tranDAO = [[transactionDAO alloc] init];
    accountEntity = [[bankAccountEntity alloc] init];
    tranEntity = [[transactionEntity alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openNewAccount:(NSString *) accNumber{
    bankAccountEntity *entity = [[bankAccountEntity alloc] init];
    entity.balance = @0;
    entity.accountNumber = accNumber;
    accountEntity =  [dao insertNewAccount:entity];
}

- (void)getAccountWithAccountNumber:(NSString*) accNumber{
    bankAccountEntity *entity = [[bankAccountEntity alloc] init];
    entity = [dao getAccount:accNumber];

}

-(void)depositIntoAnAccount:(NSString *) accNumber withMoney:(NSNumber*)moneyWithdraw{
    bankAccountEntity *entity = [dao getAccount:accNumber];
    
    if(entity){
        entity.balance = @(entity.balance.doubleValue + moneyWithdraw.doubleValue);
        transactionEntity *tranEntity1 = [[transactionEntity alloc] init];
        tranEntity1.accNumber = entity.accountNumber;
        tranEntity1.amount = moneyWithdraw;
        tranEntity1.time = [NSDate date];
        [dao updateDepositAccount:entity];
        [tranDAO saveDepositTransaction:tranEntity1];
    }
}

-(void)withdrawFromAnAccount:(NSString*) accNumber withMoney:(NSNumber*) money{
    bankAccountEntity *entity = [dao getAccount:accNumber];
    if(entity && entity.balance.doubleValue > money.doubleValue){
        entity.balance = @(entity.balance.doubleValue - money.doubleValue);
        transactionEntity *tranEntity1 = [[transactionEntity alloc] init];
        tranEntity1.accNumber = entity.accountNumber;
        tranEntity1.amount = money;
        tranEntity1.time = [NSDate date];
        [dao updateWithdrawAccount:entity];
        [tranDAO saveWithdrawTransaction:tranEntity1];
    }
}
@end
