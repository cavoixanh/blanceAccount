//
//  ViewController.h
//  BankAccount
//
//  Created by Truong Tran  The on 7/11/13.
//  Copyright (c) 2013 Thett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransactionDAO.h"
#import "BankAccountDAO.h"

@class BankAccountDAO;

@interface ViewController : UIViewController

@property (nonatomic, strong) BankAccountDAO *dao;
@property (nonatomic, strong) TransactionDAO *daoTran;
-(void)openNewAccountWithAccNumber:(NSString *)accNumber;
-(void)getAccountWithAccNumber:(NSString *) accNumber;
-(void)depositMoneyIntoAccount:(NSString*) accNumber withMoney:(NSNumber*) money;
-(void)withdrawMoneyFromAccount:(NSString*) accNumber withMoney:(NSNumber*) money;
@end
