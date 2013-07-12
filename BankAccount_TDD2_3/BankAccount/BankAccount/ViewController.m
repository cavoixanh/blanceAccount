//
//  ViewController.m
//  BankAccount
//
//  Created by Truong Tran  The on 7/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "ViewController.h"
#import "BankAccountDAO.h"
#import "BankAccountEntity.h"
@interface ViewController (){
    
}

@end

@implementation ViewController

@synthesize dao;
@synthesize daoTran;
- (void)viewDidLoad
{
    [super viewDidLoad];
    dao = [[BankAccountDAO alloc] init];
    daoTran = [[TransactionDAO alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)openNewAccountWithAccNumber:(NSString *)accNumber{
    BankAccountEntity * newEntity = [[BankAccountEntity alloc] init];
    newEntity.balance = @0;
    newEntity.accountNumber = accNumber;
    newEntity = [dao insertAnAccount:newEntity];
    if(newEntity){
        NSLog(@"insert successful");
    }
}
-(void)getAccountWithAccNumber:(NSString *) accNumber{
    BankAccountEntity * newEntity;
    newEntity = [dao getAccountWithAccNumber:accNumber];
}

-(void)depositMoneyIntoAccount:(NSString*) accNumber withMoney:(NSNumber*) money{
    BankAccountEntity *newEntity = [dao getAccountWithAccNumber:accNumber];
    newEntity.balance = @(newEntity.balance.doubleValue + money.doubleValue);
    [daoTran depo];
}

@end
