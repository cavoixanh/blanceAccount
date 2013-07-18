//
//  ViewController.m
//  bankAccount
//
//  Created by Truong Tran  The on 7/18/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "ViewController.h"
#import "bankAccountEntity.h"

@interface ViewController (){
    
    bankAccountEntity * accountEntity;
}

@end

@implementation ViewController
@synthesize dao;
- (void)viewDidLoad
{
    [super viewDidLoad];
    dao = [[bankAccountdao alloc] init];
    accountEntity = [[bankAccountEntity alloc] init];
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
        [dao updateDepositAccount:entity];
    }
}
@end
