//
//  ViewController.m
//  BankAccount
//
//  Created by Truong Tran  The on 7/2/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize accountDAO = _accountDAO;
@synthesize accountEntity = _accountEntity;
-(id)init{
    self = [super init];
    if(self){
        _accountDAO = [[BankAccountDAO alloc] init];
        _accountEntity = [[BankAccount alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (BankAccount*) openAccountWithNumber:(NSString *)accNumber{
    
    _accountEntity.balance = @0;
    _accountEntity.accountNumber = accNumber;
    _accountEntity = [_accountDAO insertNewAccount:_accountEntity];
    return _accountEntity;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
